// This file is part of "Watt"
//
// "Watt" is free software: you can redistribute it and/or modify
// it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// "Watt" is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU LESSER GENERAL PUBLIC LICENSE for more details.
//
// You should have received a copy of the GNU LESSER GENERAL PUBLIC LICENSE
// along with "Watt"  If not, see <http://www.gnu.org/licenses/>
//
//  WattApi.h
//
//  Created by Benoit Pereira da Silva on 17/05/13.
//  Copyright (c) 2013 Pereira da Silva. All rights reserved.
//

// This is a cross platform authoring and runtime api
// to developp multimedia project
// That intent to be fully supported by mac os x and IOS

// Port to Java targetting Android & non android system is possible.
// Watt is a model driven framework relying on files.


#import "Watt.h"
#import "WattObject.h"
#import "WTMModelsImports.h"

////////////
// WATT_ACL
////////////


// Watt acl was inspired by the unix permissions.
// Most of the time WattModels are not owned by anyone!
// Owned object are used only if complex workflows can apply.

/*
 
 A classic approach to protect an object is to use the "system" user
 
 [<API> applyRights:[<API> rightsFromString:@"RWXR--R--"]
            andOwner:<API>.system
                 on:objectReference];
 */

typedef enum watt_Actions{
    WattREAD=0,     //view the file
    WattWRITE=1,    //create, edit or delete
    WattEXECUTE=2   //run a script or enter a directory ?
}Watt_Action;


#ifndef WATT_ACL_CONST
#define WATT_ACL_CONST
#define WATT_ACTION_IS_NOT_AUTHORIZED_NOTIFICATION_NAME @"WATT_ACTION_IS_NOT_AUTHORIZED_NOTIFICATION_NAME"
#endif


////////////
// WATT_SOUP
////////////

typedef enum watt_F_TYPES{
    WattJx=0,   // Json + soup      * Default
    WattJ=1,    // Json  + no soup
    WattPx=2,   // Plist + soup
    WattP=3     // Plist + no soup
}Watt_F_TYPE;


@protocol WTMlocalizationDelegateProtocol;

@interface WattApi : NSObject

@property (nonatomic,assign)    id<WTMlocalizationDelegateProtocol>localizationDelegate;
@property (nonatomic,strong)    WattUser *me;
@property (nonatomic,strong)    WattRegistry *currentRegistry; // Used to register & create object ( you can change its reference at runtime)
@property (nonatomic,readonly)  WattUser *system;
@property (nonatomic,readonly)  WattGroup *systemGroup;
@property (nonatomic,strong)    NSFileManager *fileManager;

// The files with those extensions can be mixed in the soup
// You can add any binary format by adding its extension to mixableExtensions
@property (nonatomic,strong)    NSMutableArray *mixableExtensions;

// You can add paths that you want to be mixed (for DRM purposes)
@property (nonatomic,strong)    NSMutableArray *forcedSoupPaths;


//Advanced runtime configuration
//That defines the format & soup behaviour
-(void)use:(Watt_F_TYPE)ftype;

- (void)configureOnce;

#pragma mark - Registry 


- (void)mergeRegistry:(WattRegistry*)sourceRegistry
                 into:(WattRegistry*)destinationRegistry
       reIndexUinstID:(BOOL)index;


#pragma mark - ACL 

#pragma mark - rights facilities

- (void)applyRights:(NSUInteger)rights
           andOwner:(WattUser*)owner
                 on:(WattModel*)model;

- (NSString*)rightsFromInteger:(NSUInteger)numericRights;

- (NSUInteger)rightsFromString:(NSString*)stringRights;


#pragma  mark - access control

// The acl method
- (BOOL)actionIsAllowed:(Watt_Action)action on:(WattModel*)model;

- (BOOL)actionIsAllowed:(Watt_Action)action
             withRights:(NSUInteger)rights
             imTheOwner:(BOOL)owned
      imInTheOwnerGroup:(BOOL)inTheGroup;


- (BOOL)mIOwnerOf:(WattModel*)model;
- (BOOL)mIIntheGroup:(WattGroup*)group;




#pragma mark localization

//You should normaly not call directly that method
//This method is called from WTMObject from the @selector(localize) implementation.
//Calls the localizationDelegate if it is set or invokes the default implementation
- (void)localize:(WattObject*)reference withKey:(NSString*)key andValue:(id)value;


#pragma mark - relative path and path discovery

- (NSString*)absolutePathFromRelativePath:(NSString *)relativePath;
- (NSArray*)absolutePathsFromRelativePath:(NSString *)relativePath all:(BOOL)returnAll;

#pragma  mark - file paths 

// The current applicationDocumentDirectory
- (NSString*)applicationDocumentsDirectory;

// The absolute of the registry file
- (NSString*)absolutePathForRegistryFileWithName:(NSString*)name;
    
// The absolute path of the registry bundle 
- (NSString*)absolutePathForRegistryBundleWithName:(NSString*)name;


#pragma mark - files 

- (BOOL)writeData:(NSData*)data toPath:(NSString*)path;
- (NSData*)readDataFromPath:(NSString*)path;
- (BOOL)createRecursivelyRequiredFolderForPath:(NSString*)path;

#pragma mark - File serialization / deserialization

-(BOOL)writeRegistry:(WattRegistry*)registry toFile:(NSString*)path;
-(WattRegistry*)readRegistryFromFile:(NSString*)path;



#pragma mark - utilities 
- (NSString *)uuidString;

- (void)raiseExceptionWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

- (void)wattTodo:(NSString*)message; // A way to mark the job to be done;
@end

#pragma mark localization delegate prototocol

// You can implement this protocol if you want to customize the internationalization process.
@protocol WTMlocalizationDelegateProtocol <NSObject>
@required
- (void)localize:(id)reference withKey:(NSString*)key andValue:(id)value;
@end

#