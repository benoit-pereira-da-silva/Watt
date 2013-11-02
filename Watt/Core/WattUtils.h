//
//  WattFileUtilities.h
//  Watt
//
//  Created by Benoit Pereira da Silva on 02/11/2013.
//  Copyright (c) 2013 Pereira da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WattRegistry;

////////////
// WATT_SOUP
////////////

typedef enum watt_F_TYPES{
    WattJx=0,   // Json + soup      * Default
    WattJ=1,    // Json  + no soup
    WattPx=2,   // Plist + soup
    WattP=3     // Plist + no soup
    // We plan to add Message Pack + soup
}Watt_F_TYPE;


@interface WattUtils : NSObject

@property (atomic,strong) NSFileManager *fileManager;

// The files with those extensions can be mixed in the soup (mixing is a sort of encryption)
// You can add any binary format by adding its extension to mixableExtensions
@property (nonatomic,strong)    NSMutableArray *mixableExtensions;

// You can add paths that you want to be mixed (for DRM purposes)
@property (nonatomic,strong)    NSMutableArray *forcedSoupPaths;

/**
 * Advanced runtime configuration
 * When using for example WattJx : the format is JSON and the data is mixed in a binary file soup
 *  @param ftype the format & soup behaviour
 */
-(void)use:(Watt_F_TYPE)ftype;


#pragma mark - relative path and path discovery


/**
 *  Returns an existing absolute paths from a relative path
 *
 *  @param relativePath    the relative path
 *  @param wattBundleName  the watt bundle name
 *
 *  @return the absolute path of existing file path and nil if the file does not exists.
 */
- (NSString*)absolutePathFromRelativePath:(NSString *)relativePath
                         inBundleWithName:(NSString*)wattBundleName;


/**
 *  Returns an array of existing absolute paths from the relative path
 *
 *  @param relativePath   the relative path
 *  @param wattBundleName the watt bundle name
 *  @param returnAll      if YES returns all else only the first.
 *
 *  @return an Array of absolute existing file paths (excludes unexisting path)
 */
- (NSArray*)absolutePathsFromRelativePath:(NSString *)relativePath
                         inBundleWithName:(NSString*)wattBundleName
                                      all:(BOOL)returnAll;


#pragma  mark - file paths

/**
 *  The current applicationDocumentDirectory
 *
 *  @return The path of the directory
 */
- (NSString*)applicationDocumentsDirectory;

/**
 *  Returns the absolute path of the registry serialization file
 *
 *  @param name the registry name
 *
 *  @return the absolute path of the registry serialization file
 */
- (NSString*)absolutePathForRegistryFileWithName:(NSString*)name;

//

/**
 *  Returns the absolute path of the registry bundle folder
 *
 *  @param name the registry name
 *
 *  @return the absolute path of the registry bundle folder
 */
- (NSString*)absolutePathForRegistryBundleFolderWithName:(NSString*)name;



#pragma mark - files I/O

- (BOOL)writeData:(NSData*)data toPath:(NSString*)path;
- (NSData*)readDataFromPath:(NSString*)path;
- (BOOL)createRecursivelyRequiredFolderForPath:(NSString*)path;
- (BOOL)removeItemAtPath:(NSString*)path;

#pragma mark - File serialization / deserialization

/**
 * Serializes the registry to a file only if registry.hasChanged==YES
 *
 *  @param registry the registry to be serialized
 *  @param path     the path
 *
 *  @return the success of the operation
 */
-(BOOL)writeRegistryIfNecessary:(WattRegistry*)registry toFile:(NSString*)path;

/**
 *  Serializes the registry to a file
 *
 *  @param registry the registry to be serialized
 *  @param path     the path
 *
 *  @return the success of the operation
 */
-(BOOL)writeRegistry:(WattRegistry*)registry toFile:(NSString*)path;

/**
 *  Deserializes a registry from a file.
 *
 *  @param path the path
 *
 *  @return the registry
 */
-(WattRegistry*)readRegistryFromFile:(NSString*)path;



#pragma mark - Unique identification

/**
 *  Returns an unique identifier string
 *
 *  @return the identifier
 */
- (NSString *)uuidString;


#pragma  mark - exceptions

/**
 *  Raises an exception
 *
 *  @param format the format
 */
- (void)raiseExceptionWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);


#pragma  mark - dev temp methods

/**
 *  Display a todo message
 *
 *  @param message The message
 */
- (void)wattTodo:(NSString*)message; // A way to mark the job to be done;

@end
