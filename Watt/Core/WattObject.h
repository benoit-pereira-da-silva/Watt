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
//  WTMObject.h

//  Created by Benoit Pereira da Silva on 09/05/13.
//  Copyright (c) 2013 Pereira da Silva. All rights reserved.
//

#import "Watt.h"

@class WattRegistry, WattObject, WattApi;

#pragma mark - WattCopying

@protocol WattCopying
@required
/**
 *  Equivalent to NSCopying but with a reference to an explicit registry 
 *  You should implement this method (sample) :
 *
 * - (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry{
 *  <YourClass> *instance=[super wattCopyInRegistry:destinationRegistry];
 *  instance->_registry=destinationRegistry;
 *  instance->_aString=[_aString copy];
 *  instance->_aScalar=_aScalar;
 *  instance->_aWattCopyableObject=[_aWattCopyableObject wattCopyInRegistry:destinationRegistry];
 *  return instance;
 *  }
 *
 *  @param destinationRegistry the registry
 *
 *  @return the copy of the instance in the destinationRegistry
 */
- (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry;
@optional

/**
 *  Implemented in WattObject (no need normaly to implement)
 *  If the copy allready exists in the destination registry
 *  This method returns the existing reference
 *
 *  @param destinationRegistry the registry
 *
 *  @return return the copy
 */
- (instancetype)instancebyCopyTo:(WattRegistry*)destinationRegistry;
@end


#pragma mark - WattExtraction

#warning INTERESTING We should deprecate WattExtraction and exclude props according to ExclusionPaths based on _propertiesKeys

// WOOZOO's SUGGESTIONS !
// NOTE WE COULD IMPLEMENT AN EXTRACTION WITH ExclusionPaths : "ClassName.propertyName.propertyName"
// or Inclusion Path
// or Predicate filters

@protocol WattExtraction <NSObject>
@required
/**
 *  Equivalent to WattCopying but without integration of non extractible properties
 *  You should implement this method the same way WattCopying but :
 *  instance->_aExtractible=< the copy logic >
 *  instance->_aNonExtractible=nil;
 *  return instance;
 *  }
 *
 *  @param destinationRegistry the registry
 *
 *  @return the copy of the instance in the destinationRegistry
 */
- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry;

- (instancetype)extractInstancebyCopyTo:(WattRegistry*)destinationRegistry;

//- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry withExclusionPathList:(NSArray*)exclusionPathList;

@end


#pragma mark - WattCoding

@protocol WattCoding <NSObject>
@required
- (NSDictionary *)dictionaryRepresentationWithChildren:(BOOL)includeChildren;
- (NSMutableDictionary*)dictionaryOfPropertiesWithChildren:(BOOL)includeChildren;
@end

#pragma mark - WattObject

@interface WattObject : NSObject<WattCoding,WattCopying,WattExtraction>{
@private
    NSMutableArray *_propertiesKeys;    // Used by the WTMObject root object to store the properties name
@protected
    NSInteger _uinstID;
    WattRegistry*_registry;
    BOOL _isAnAlias;
}


@property (readonly)NSInteger uinstID;
@property (readonly)WattRegistry*registry;

// You should normally use only initInRegistry directly

- (instancetype)init;
- (instancetype)initInRegistry:(WattRegistry*)registry;
- (instancetype)initInRegistry:(WattRegistry*)registry withPresetIdentifier:(NSInteger)identifier; //Used for reinstanciation from a device to another
- (instancetype)initAsAliasWithIdentifier:(NSInteger)identifier; // instanciate an alias

// ANY WattObject should be unRegistered to be released from its registry
// autoUnRegister is a facility
-(void)autoUnRegister;

#pragma mark - Aliasing

- (BOOL)isAnAlias;
- (void)resolveAliases;

- (NSDictionary *)aliasDictionaryRepresentation;
- (NSString*)aliasDescription;

#pragma mark -

+ (instancetype)instanceFromDictionary:(NSDictionary *)aDictionary
                            inRegistry:(WattRegistry*)registry
                       includeChildren:(BOOL)includeChildren;

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

// Returns all the properties keys of the object.
- (NSArray*)propertiesKeys;



@end