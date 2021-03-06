//
//  WattPool.m
//  Watt
//
//  Created by Benoit Pereira da Silva on 04/11/2013.
//  Copyright (c) 2013 Pereira da Silva. All rights reserved.
//

#import "WattRegistryPool.h"
#import "watt.h"

/**
 *  Runs synchronously a block on the main queue without deadlocking
 */
void runOnMainQueueWithoutDeadlocking(void (^block)(void)){
    if ([NSThread isMainThread]){
        block();
    }else{
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

static NSString* kDefaultName        = @"default";
static NSString* kRegistryFileName   = @"registry";
static NSString* kWattBundle         = @".watt";
static NSString* trashFolderName     = @"trash";
static NSString* mapRegistryID       = @"pool";
static NSString* rimbaud =@"Q9tbWVqZWRlc2NlbmRhaXNkZXNGbGV1dmVzaW1wYXNzaWJsZXMsSmVuZW1lc2VudGlzcGx1c2d1aWTpcGFybGVzaGFsZXVyczpEZXNQZWF1eC1Sb3VnZXNjcmlhcmRzbGVzYXZhaWVudHByaXNwb3VyY2libGVzLExlc2F5YW50Y2xvdelzbnVzYXV4cG90ZWF1eGRlY291bGV1cnMuSjpdGFpc2luc291Y2lldXhkZXRvdXNsZXPpcXVpcGFnZXMsUG9ydGV1cmRlYmzpc2ZsYW1hbmRzb3VkZWNvdG9uc2FuZ2xhaXMuUXVhbmRhdmVjbWVzaGFsZXVyc29udGZpbmljZXN0YXBhZ2VzLExlc0ZsZXV2ZXNtP29udGxhaXNz6WRlc2NlbmRyZW5amV2b3VsYWlzLkRhbnNsZXNjbGFwb3RlbWVudHNmdXJpZXV4ZGVzbWFy6WVzLE1vaSxsP2F1dHJlaGl2ZXIscGx1c3NvdXJkcXVlbGVzY2VydmVhdXhkP2VuZmFudHMsSmVjb3VydXMhRXRs";


#pragma mark - WattRegistryPool extension interface

@interface WattRegistryPool(){
    
    // The registry cache ( references the registry in memory)
    NSMutableDictionary*_registries;
    
    // The pool folder relative path
    NSString* _poolFolderRelativePath;
    
    // The pool folder absolute path
    NSString*_poolFolderAbsolutePath;
    
    NSString *_applicationDocumentsDirectory;
    
    // DATA SOUP
    // Should be optimized in c.
    NSMutableArray   *_secretBooleanList; // [@(YES),@(NO), ....];
    NSUInteger       _secretLoopIndex;    // The looping index
    NSUInteger       _secretLength;       //
    
}

// NOTE :
// - (BOOL)addRegistry:(WattRegistry*)registry;
// is declared in WattObject.m @interface WattRegistryPool (Invisible)
// To remain invisible

/**
 *  Return an existing path from registry file path (absolute or relative)
 *
 *  @param path the path used for discovery
 *
 *  @return un existing path or nil if there is no registry file.
 */
- (NSString*)foundRegistryFilePathForAnyModeFromPath:(NSString*)path;



// File serialization / deserialization

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
 *  @param identifier the unique string identifier
 *  @return the registry
 */
-(WattRegistry*)readRegistryFromFile:(NSString*)path withUniqueStringIdentifier:(NSString*)identifier;


// Serialization mode and suffixes


/**
 *  Returns the wattSerializationMode by parsing the path suffix
 *
 *  @param path the path
 *
 *  @return the serialization mode
 */
- (WattSerializationMode)serializationModeFromRegistryFilePath:(NSString*)path;


/**
 *  Returns the suffix according to the serialization mode
 *
 *  @param mode the serialization mode
 *
 *  @return the suffix
 */
- (NSString*)suffixFor:(WattSerializationMode)mode;

@end

#pragma mark - Implementation

@implementation WattRegistryPool

@synthesize fileManager = _fileManager;
@synthesize mixableExtensions = _mixableExtensions;
@synthesize forcedSoupPaths = _forcedSoupPaths;
@synthesize serializationMode = _serializationMode;

@synthesize faultTolerenceOnMissingKVCkeys = _faultTolerenceOnMissingKVCkeys;
@synthesize controlKVCRegistriesAtRuntime = _controlKVCRegistriesAtRuntime;

#pragma mark - Initializer


#if TARGET_OS_IPHONE

/**
 *  If the pool does not exists it is created.
 *
 *  @param path   the pool relative path
 *  @param mode   the serialization mode
 *  @param secret the secret key used when mixing the soup
 *
 *  @return the pool of registries
 */
-(instancetype)initWithRelativePath:(NSString*)path
                  serializationMode:(WattSerializationMode)mode
                       andSecretKey:(NSString*)secret{
    self=[super init];
    if(self){
        if(!secret)
            secret=rimbaud;
        _serializationMode=mode;
        if(mode==WattJx || mode==WattPx)
            [self _generateTheSymetricKeyFrom:secret];
        _registries=[NSMutableDictionary dictionary];
        _mixableExtensions=[NSMutableArray array];
        _forcedSoupPaths=[NSMutableArray array];
        _poolFolderRelativePath=[self _filter:path];
        _poolFolderAbsolutePath=[[self applicationDocumentsDirectory]stringByAppendingString:_poolFolderRelativePath];        //Create the trash folder if necessary
        [self createRecursivelyRequiredFolderForPath:[self _trashFolderPath]];
        _controlKVCRegistriesAtRuntime=NO;
        _faultTolerenceOnMissingKVCkeys=YES;
    }
    return self;
}

#else



/**
 *  If the pool does not exists it is created.
 *
 *  @param absolutePath     the application document directory path
 *  @param poolRelativePath the pool folder relative path
 *  @param mode             the serialization mode
 *  @param secret           the secret key used when mixing the soup
 *
 *  @return  the pool of registries
 */
-(instancetype)initWithApplicationDocumentsDirectoryPath:(NSString*)absolutePath
                    andRelativePoolPath:(NSString*)poolRelativePath
                  serializationMode:(WattSerializationMode)mode
                       andSecretKey:(NSString*)secret{
    self=[super init];
    if(self){
        if(!secret)
            secret=rimbaud;
        _serializationMode=mode;
        if(mode==WattJx || mode==WattPx)
            [self _generateTheSymetricKeyFrom:secret];
        _registries=[NSMutableDictionary dictionary];
        _mixableExtensions=[NSMutableArray array];
        _forcedSoupPaths=[NSMutableArray array];
        _applicationDocumentsDirectory=[absolutePath copy];
        _poolFolderRelativePath=poolRelativePath;
        _poolFolderAbsolutePath=[[self applicationDocumentsDirectory]stringByAppendingString:_poolFolderRelativePath];
        //Create the trash folder if necessary
        [self createRecursivelyRequiredFolderForPath:[self _trashFolderPath]];
        _controlKVCRegistriesAtRuntime=NO;
        _faultTolerenceOnMissingKVCkeys=YES;
    }
    return self;
}

#endif



#pragma mark - Registries management

/**
 *  Adds the registry to the pool
 *
 *  @param registry the instance
 *
 *  @return YES if there was no instance.
 */
- (BOOL)addRegistry:(WattRegistry*)registry{
    if(registry.pool && ![registry.pool isEqual:self]){
        [self raiseExceptionWithFormat:@"You cannot add a registry to another pool source pool : %@ destination pool : %@ ",registry.pool,self];
    }
    if(![_registries objectForKey:registry.uidString]){
        registry.pool=self;
        [_registries setObject:registry
                        forKey:registry.uidString];
        return YES;
    }
    return NO;
}



/**
 *  Unloads the registry with a given id
 *
 *  @param registryUidString the identifier
 *
 *  @return YES if there was a registry with this identifier
 */
- (BOOL)unloadRegistryWithRegistryID:(NSString*)registryUidString{
    WattRegistry*registry=[_registries objectForKey:registryUidString];
    if(registry){
        [self detachRegistry:registry];
        [registry purgeRegistry];
        [_registries removeObjectForKey:registryUidString];
        return  YES;
    }else{
        return NO;
    }
}



/**
 *  Unloads all the registries
 *
 *  @return YES if it is a success.
 */
- (BOOL)unloadRegistries{
    BOOL status=YES;;
    for (NSString*keyID in [_registries allKeys]) {
        status=status&&[self unloadRegistryWithRegistryID:keyID];
        [_registries removeObjectForKey:keyID];
    }
    return status;
}

/**
 *  The registry is removed from the pool but not clean up in memory.
 *  This method is used to move a registry from a pool to another.
 *
 *  @param registry the registry to deReference
 *
 *  @return YES if the registry was referenced
 */
- (BOOL)detachRegistry:(WattRegistry*)registry{
    if([_registries objectForKey:registry.uidString]){
        registry.pool=nil;
        [_registries removeObjectForKey:registry.uidString];
        return YES;
    }
    return NO;
}


/**
 *  Removes the registry and its dependencies
 *
 *  @param registry the instance
 *
 *  @return YES if there was an instance.
 */
- (BOOL)trashRegistry:(WattRegistry*)registry{
    if([_registries objectForKey:registry.uidString]){
        [self trashItemFromPath:[self absolutePathForRegistryBundleFolderWithName:registry.uidString]];
        [self unloadRegistryWithRegistryID:registry.uidString];
        return YES;
    }
    return NO;
}




/**
 *  Use this method to create, acces or load a registry in a given serialization mode
 *
 *  Returns a registry identified by its registryUidString
 *  If the registry does not exist it is created with default serialization mode
 *
 *  @param registryUidString the identifier if nil the uidString is created
 *  @param mode the serialization mode
 *
 *  @return the registry or nil
 */
- (WattRegistry*)registryWithUidString:(NSString*)registryUidString{
    WattRegistry*registry=[_registries objectForKey:registryUidString];
    if(registry)
        return registry;// We return if the registry is alaready added.
    if(!registryUidString)
        registryUidString=[self uidStringCreate];
    NSString*p=[self absolutePathForRegistryFileWithName:registryUidString];
    if([self.fileManager fileExistsAtPath:p]){
        registry=[self readRegistryFromFile:p withUniqueStringIdentifier:registryUidString];
    }
    if(!registry){
        // We create a registry with the default serialization mode
        registry=[WattRegistry registryWithUniqueStringIdentifier:registryUidString
                                                           inPool:self];
    }
    return registry;
}



/**
 *  Saves the registry
 *
 *  @param registry the registry to be saved
 */
- (void)saveRegistry:(WattRegistry*)registry{
    NSString*path=[self absolutePathForRegistryFileWithName:registry.uidString];
    if([self writeRegistry:registry
                    toFile:path]){
        registry.hasChanged=NO;
        WTLog(@"Registry %@ has been saved",registry.uidString);
    }else{
        WTLog(@"An error occured while saving registry : %@ ",registry.uidString);
    }
}


/**
 *  Saves all the registries
 */
- (void)saveRegistries{
    for (NSString*keyID in _registries) {
        WattRegistry*registry=[_registries objectForKey:keyID];
        [self saveRegistry:registry];
    }
}


/**
 *  Saves all the registries with hasChanged flag set to YES
 */
- (void)saveRegistriesIfNecessary{
    for (NSString*keyID in _registries) {
        WattRegistry*registry=[_registries objectForKey:keyID];
        if(registry.hasChanged)
            [self saveRegistry:registry];
        
    }
}

/**
 *  Returns the list of the registry's identifiers
 *
 *  @return the list of string
 */
- (NSArray*)registriesUidStringList{
    NSError *error=nil;
    NSArray*array=[self.fileManager contentsOfDirectoryAtPath:_poolFolderAbsolutePath
                                                        error:&error];
    if(array && !error){
        NSMutableArray *list=[NSMutableArray array];
        for (NSString*s in array) {
            if([s rangeOfString:kWattBundle].location!=NSNotFound){
                [list addObject:[s stringByDeletingPathExtension]];
            }
        }
        // Registries in memory
        for (NSString*uidString in _registries) {
            // We add uidString that have not been file detected.
            if([list indexOfObject:uidString]==NSNotFound){
                [list addObject:[uidString copy]];
            };
        }
        return list;
    }
    return nil;
}


#pragma mark - Object grabber.

/**
 *  Returns the object by its WattExternalReference
 *
 *  @param WattExternalReference the object external reference of a watt object into another registry
 *
 *  @return the object or nil
 */
- (id)objectByWattReference:(WattExternalReference*)externalReference{
    WattRegistry*registry=[self registryWithUidString:externalReference.registryUidString];
    return [registry objectWithUinstID:externalReference.objectUinstID];
}


/**
 *  Returns the object by its registryUidString and objectUinstID
 *
 *  @param wattReference the object external reference of a watt object into another registry
 *
 *  @return the object or nil
 */
- (id)objectByRegistryID:(NSString*)registryUidString andObjectUinstID:(NSInteger)objectUinstID{
    WattRegistry*registry=[self registryWithUidString:registryUidString];
    return [registry objectWithUinstID:objectUinstID];
}



/**
 *  An alias of the root object
 *
 *  @param registryUidString the registry UID
 *
 *  @return the object or nil
 */
-(id)rootObjectOfRegistryWithID:(NSString*)registryUidString{
    return [self objectByRegistryID:registryUidString andObjectUinstID:kWattRegistryRootUinstID];
}

#pragma mark - files

- (NSString*)poolFolderRelativePath{
    return _poolFolderRelativePath;
    
}

/**
 *  The absolute path of the pool folder
 *
 *  @return the path
 */
- (NSString*)poolFolderAbsolutePath{
    return _poolFolderAbsolutePath;
}

#pragma mark - Trash

- (BOOL)trashItemFromPath:(NSString*)path{
    if(!path && [path length]<2){
        return NO;
    }
    NSError*error=nil;
    NSString *relativeDestination=[path stringByReplacingOccurrencesOfString:[self poolFolderAbsolutePath]
                                                                  withString:@""];
    [self.fileManager moveItemAtPath:[self _filter:path]
                              toPath:[[self _trashFolderPath] stringByAppendingString:relativeDestination]
                               error:&error];
    if (error) {
        return NO;
    }
    return YES;
}


/**
 *  Definitively suppress the folder and file cntent
 */
- (void)emptyTheTrash{
    [self removeItemAtPath:[self _trashFolderPath]];
    // We recreate the trash
    [self createRecursivelyRequiredFolderForPath:[self _trashFolderPath]];
}

- (NSString*)_trashFolderPath{
    return[_poolFolderAbsolutePath stringByAppendingFormat:@"%@",trashFolderName];
}


#pragma mark - global destruction

/**
 *  Use with caution
 *  Deletes all the data and files
 */
- (void)deletePoolFiles{
    [self removeItemAtPath:_poolFolderAbsolutePath];
}





#pragma mark - bundle files relative path and path discovery


// For assets

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
{
    NSArray *r=[self absolutePathsFromRelativePath:relativePath
                                  inBundleWithName:wattBundleName
                                               all:NO];
    if([r count]>0)
        return [r objectAtIndex:0];
    return nil;
}





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
                                      all:(BOOL)returnAll{
    
    NSString *baseRelativePath = [self _filter:relativePath];
    NSArray *orientation_modifiers=@[@""];
    NSArray *device_modifiers=@[@""];
    NSArray *pixel_density_modifiers=@[@"@2x",@""];
    NSString *extension = [baseRelativePath pathExtension];
    NSMutableArray *result=[NSMutableArray array];
    
    // Clean up the basename
    
    baseRelativePath=[baseRelativePath stringByDeletingPathExtension];
    for (NSString*deviceModifier in  device_modifiers) {
        baseRelativePath=[baseRelativePath stringByReplacingOccurrencesOfString:deviceModifier withString:@""];
    }
    
    for (NSString*orientationModifier in  orientation_modifiers) {
        baseRelativePath=[baseRelativePath stringByReplacingOccurrencesOfString:orientationModifier withString:@""];
    }
    
    for (NSString*pixelDensity in  pixel_density_modifiers) {
        baseRelativePath=[baseRelativePath stringByReplacingOccurrencesOfString:pixelDensity withString:@""];
    }
#if TARGET_OS_IPHONE
    if(isLandscapeOrientation()){
        orientation_modifiers=@[@"-Landscape",@""];
    }else{
        orientation_modifiers=@[@"-Portrait",@""];
    }
    if(isIpad()){
        device_modifiers=@[@"~ipad",@""];
    }else if(isWidePhone()){
        device_modifiers=@[@"~iphone5",@"~iphone",@""];
    }else{
        device_modifiers=@[@"~iphone",@""];
    }
#endif
    // Find the most relevant asset
    
    for (NSString*orientationModifier in  orientation_modifiers) {
        for (NSString*deviceModifier in  device_modifiers) {
            for (NSString*pixelDensity in  pixel_density_modifiers) {
                NSString *component=[NSString stringWithFormat:@"%@%@%@%@",baseRelativePath,orientationModifier,pixelDensity,deviceModifier];
                
                
                NSString *pth=nil;
                if(wattBundleName){
                    pth=[NSString stringWithFormat:@"%@%@.%@",[self absolutePathForRegistryBundleFolderWithName:wattBundleName],component,extension?extension:@""];
                }else{
                    //
                    pth=[NSString stringWithFormat:@"%@%@.%@",[self applicationDocumentsDirectory],component,extension?extension:@""];
                }
                
                if([self.fileManager fileExistsAtPath:pth]){
                    [result addObject:pth];
                    if(!returnAll)
                        return result;
                }
                
                // APPLICATION BUNDLE ATTEMPT
                pth=[[NSBundle mainBundle] pathForResource:component ofType:extension];
                if(pth && [pth length]>1){
                    [result addObject:pth];
                    if(!returnAll)
                        return result;
                }
            }
        }
    }
    return result;
}


/**
 *  Return an existing path from registry file path (absolute or relative)
 *
 *  @param path the path used for discovery
 *
 *  @return un existing path or nil if there is no registry file.
 */
- (NSString*)foundRegistryFilePathForAnyModeFromPath:(NSString*)path{
    NSArray*s=[self _suffixes];
    NSString *bPath=[self _filter:path];
    if ([path rangeOfString:[self applicationDocumentsDirectory]].location==NSNotFound){
        // It is a relative path.
        bPath=[[self applicationDocumentsDirectory] stringByAppendingString:bPath];
    }
    bPath=[bPath stringByDeletingPathExtension];
    for (NSString*suffix in s) {
        NSString *attemptPath=[bPath stringByAppendingFormat:@".%@",suffix];
        if([self.fileManager fileExistsAtPath:attemptPath])
            return attemptPath;
    }
    return nil;
}



#pragma  mark - file paths


- (NSString *) applicationDocumentsDirectory{
    if(!_applicationDocumentsDirectory){
#if TARGET_OS_IPHONE
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        _applicationDocumentsDirectory=[self _filter:[basePath stringByAppendingString:@"/"]];
#else
        // If the absolute path was nil
        // We create automatically a data folder
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath=[paths lastObject];
        _applicationDocumentsDirectory=[basePath stringByAppendingFormat:@"/Watt/%@/",[self uidStringCreate]];
#endif
    }
    return _applicationDocumentsDirectory;
}


- (NSString*)absolutePathForRegistryFileWithName:(NSString*)name{
    return [[self applicationDocumentsDirectory] stringByAppendingFormat:@"%@%@",_poolFolderRelativePath?_poolFolderRelativePath:@"",[self _wattRegistryFileRelativePathWithName:name]] ;
}


- (NSString *)absolutePathForRegistryBundleFolderWithName:(NSString*)name{
    return [[self applicationDocumentsDirectory]stringByAppendingFormat:@"%@%@",_poolFolderRelativePath?_poolFolderRelativePath:@"",[self _wattBundleRelativePathWithName:name]] ;
}


- (NSString*)_wattBundleRelativePathWithName:(NSString *)name{
    if(!name)
        name=kDefaultName;
    return [NSString stringWithFormat:@"%@%@/",name,kWattBundle];
}


- (NSString *)_wattRegistryFileRelativePathWithName:(NSString*)name{
    NSString *bPath=[self _wattBundleRelativePathWithName:name];
    return [bPath stringByAppendingFormat:@"%@.%@",kRegistryFileName,[self _suffix]];
}

- (NSString*)_suffix{
    return [self _suffixForSerializationMode:_serializationMode];
}

- (NSString*)_suffixForSerializationMode:(WattSerializationMode)mode{
    return [[self _suffixes] objectAtIndex:mode];
}

- (NSString*)_pathForFileName:(NSString*)fileName{
    return [[self applicationDocumentsDirectory] stringByAppendingFormat:@"/%@",fileName];
}


#pragma mark - files I/O

/**
 *  Write the data mixing if necessary
 *
 *  @param data The nsdata to write to the path
 *  @param path the destination path
 *
 *  @return the success of the file operation
 */

-(BOOL)writeData:(NSData*)data toPath:(NSString*)path{
    BOOL __block result=YES;
    runOnMainQueueWithoutDeadlocking(^{
        NSString*filteredPath=[self _filter:path];
        [self createRecursivelyRequiredFolderForPath:filteredPath];
        NSData *soup=[self _dataSoup:data mix:[self _shouldMixPath:filteredPath]];
        NSError *error=nil;
#if TARGET_OS_IPHONE
        [soup writeToFile:filteredPath options:NSDataWritingAtomic|NSDataWritingFileProtectionNone error:&error];
#else
        [soup writeToFile:filteredPath options:NSDataWritingAtomic error:&error];
#endif
        if(error){
            WTLog(@"Error while writing %i bytes to %@",(int)[data length],filteredPath);
            result=NO;
        }else{
            result=YES;
        }
    });
    return result;
}


/**
 *  Reads the data and mix if necessary (mixing is reversible)
 *
 *  @param path the path
 *
 *  @return the Data
 */
-(NSData*)readDataFromPath:(NSString*)path{
    NSString*filteredPath=[self _filter:path];
    NSData*__block resultData=nil;
    runOnMainQueueWithoutDeadlocking(^{
        NSData *data=[NSData dataWithContentsOfFile:filteredPath];
        resultData= [self _dataSoup:data mix:[self _shouldMixPath:filteredPath]];
    });
    return resultData;
}


/**
 *  Write the data mixing if necessary
 *
 *  @param data The nsdata to write to the path
 *  @param path the destination path
 *
 *  @return the success of the file operation
 */
- (BOOL)writeData:(NSData*)data toPath:(NSString*)path withForcedSerializationMode:(WattSerializationMode)mode{
    NSString*filteredPath=[self _filter:path];
    [self createRecursivelyRequiredFolderForPath:filteredPath];
    data=[self _dataSoup:data mix:(mode==WattJx||mode==WattPx)];
    return [data writeToFile:filteredPath atomically:YES];
}

/**
 *  Reads the data and mix if necessary
 *
 *  @param path the path
 *  @param mode
 *
 *  @return the Data
 */
- (NSData*)readDataFromPath:(NSString*)path withForcedSerializationMode:(WattSerializationMode)mode{
    NSString*filteredPath=[self _filter:path];
    NSData *data=[NSData dataWithContentsOfFile:filteredPath];
    return [self _dataSoup:data mix:(mode==WattJx||mode==WattPx)];
}


-(BOOL)_shouldMixPath:(NSString*)path{
    NSString*filteredPath=[self _filter:path];
    if([_forcedSoupPaths indexOfObject:filteredPath]!=NSNotFound){
        return YES;
    }
    BOOL modeAllowsToMix=((_serializationMode==WattJx)||(_serializationMode==WattPx));
    if(modeAllowsToMix){
        if([_mixableExtensions indexOfObject:[filteredPath pathExtension]]!=NSNotFound ||
           [[path pathExtension] isEqualToString:@"jx"]||
           [[path pathExtension] isEqualToString:@"px"]){
            return YES;
        }
    }
    return NO;
}






-(BOOL)createRecursivelyRequiredFolderForPath:(NSString*)path{
    NSString*filteredPath=[self _filter:path];
    if([path rangeOfString:[self applicationDocumentsDirectory]].location==NSNotFound){
        return NO;
    }
    if(![[filteredPath substringFromIndex:filteredPath.length-1] isEqualToString:@"/"])
        filteredPath=[filteredPath stringByDeletingLastPathComponent];
    
    if(![self.fileManager fileExistsAtPath:filteredPath]){
        NSError *error=nil;
        [self.fileManager createDirectoryAtPath:filteredPath
                    withIntermediateDirectories:YES
                                     attributes:nil
                                          error:&error];
        if(error){
            return NO;
        }
    }
    return YES;
}


- (BOOL)removeItemAtPath:(NSString*)path{
    NSString*filteredPath=[self _filter:path];
    NSError *error=nil;
    [self.fileManager removeItemAtPath:filteredPath
                                 error:&error];
    if(error){
        WTLog(@"Impossible to delete %@",filteredPath);
        return NO;
    }
    return YES;
    
}


/**
 *  Returns the number of registries in the pool
 *
 *  @return the count
 */
- (NSUInteger)registryCount{
    return [_registries count];
}

#pragma mark -  serialization


-(BOOL)writeRegistryIfNecessary:(WattRegistry*)registry toFile:(NSString*)path{
    NSString*filteredPath=[self _filter:path];
    if([registry hasChanged]){
        [registry setHasChanged:NO];
        return  [self writeRegistry:registry toFile:filteredPath];
    }
    return YES;
}

-(BOOL)writeRegistry:(WattRegistry*)registry toFile:(NSString*)path{
    NSString*filteredPath=[self _filter:path];
    NSArray *array=[registry arrayRepresentation];
    if(((_serializationMode==WattPx)||(_serializationMode==WattP))){
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
        return [self writeData:data toPath:filteredPath];
    }else{
        return [self _serializeToJson:array toPath:filteredPath];
    }
}

-(WattRegistry*)readRegistryFromFile:(NSString*)path withUniqueStringIdentifier:(NSString*)identifier{
    NSString*filteredPath=[self _filter:path];
    BOOL isDirectory=NO;
    if(self.fileManager && ![self.fileManager fileExistsAtPath:filteredPath isDirectory:&isDirectory]){
        [self raiseExceptionWithFormat:@"Unexisting registry path %@",filteredPath];
    }
    
    _serializationMode=[self serializationModeFromRegistryFilePath:filteredPath];
    NSArray *array=nil;
    if(((_serializationMode==WattPx)||(_serializationMode==WattP))){
        NSData *data=[self readDataFromPath:filteredPath];
        array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }else{
        array=[self _deserializeFromJsonWithPath:filteredPath];
    }
    if(array){
        return [WattRegistry instanceFromArray:array
                         withSerializationMode:_serializationMode
                        uniqueStringIdentifier:identifier
                                        inPool:self
                                resolveAliases:YES];
    }
    
    return nil;
}


// JSON private methods

- (BOOL)_serializeToJson:(id)reference toPath:(NSString*)path{
    NSError*__block errorJson=nil;
    NSData *__block data=nil;
    @try {
    
        runOnMainQueueWithoutDeadlocking(^{
            data=[NSJSONSerialization dataWithJSONObject:reference
                                                 options:NSJSONWritingPrettyPrinted
                                                   error:&errorJson];
        
        if(errorJson){
            WTLog(@"JSON error on %@ %@",[errorJson localizedDescription],reference);
        }
            
        });
   }
    @catch (NSException *exception) {
        return NO;
    }
    @finally {
    }
    if(data){
        return [self writeData:data toPath:[self _filter:path]];
    }else{
        return NO;
    }
}

- (id)_deserializeFromJsonWithPath:(NSString*)path{
    NSData *__block data=[self readDataFromPath:[self _filter:path]];
    NSError*__block errorJson=nil;
    @try {
        // We use mutable containers and leaves by default.
        id __block result=nil;
        runOnMainQueueWithoutDeadlocking(^{
            result=[NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments
                                                     error:&errorJson];
        });
        return result;
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
    return nil;
}




#pragma mark - Data SOUP


/**
 * Mixes the data if necessary
 * The data soup method is a simple and fast encoding / decoding method.
 * That invert or revers each byte value according to the _secretBooleanList
 * It is a simple symetric encoding to prevent from manual editing.
 * It is not a securized crypto method.
 *
 *  @param data the original data
 *  @param mix  should we mix ?
 *
 *  @return the mixed NSData
 */
-(NSData*)_dataSoup:(NSData*)data  mix:(BOOL)mix{
    if(mix && _secretBooleanList && [_secretBooleanList count]>1){
        const char *bytes = [data bytes];
        char *mixedBytes = malloc(sizeof(char) * [data length]);
        _secretLoopIndex=0;
        for (int i = 0; i < [data length]; i++){
            // QUICK dirty and not memory efficient
            // Should be optimized in c.
            // Objective C is certainly not efficient here
            BOOL shouldReverse=[[_secretBooleanList objectAtIndex:_secretLoopIndex] boolValue];
            if(shouldReverse)
                mixedBytes[i] = (~ bytes[i]);
            else
                mixedBytes[i] = (- bytes[i]);
            _secretLoopIndex++;
            if(_secretLoopIndex>=_secretLength){
                _secretLoopIndex=0;
            }
        }
        NSData *mixed =[NSData dataWithBytes:mixedBytes length:[data length]];
        free(mixedBytes);
        return mixed;
    }else{
        return data;
    }
}





/**
 *  Generate a _secretBooleanList from a secretKey
 *
 *  @param secretKey the string secret key
 */
- (void)_generateTheSymetricKeyFrom:(NSString*)secretKey{
    if(secretKey){
        _secretBooleanList=[NSMutableArray array];
        NSUInteger nbOfChar=[secretKey length];
        for (int i=1; i<nbOfChar ; i++) {
            NSString *previousChar=[secretKey substringWithRange:NSMakeRange(i-1,1)];
            NSString *currentChar=[secretKey substringWithRange:NSMakeRange(i, 1)];
            // We compare the previous and the current char.
            // If previousChar is > currentChar then we add YES to the _secretBooleanList
            // THE _secretBooleanList will be an array of : YES, NO, NO, YES ....
            if([previousChar compare:currentChar]==NSOrderedAscending){
                [_secretBooleanList addObject:@(YES)];
            }else{
                [_secretBooleanList addObject:@(NO)];
            }
        }
        _secretLoopIndex=-1;
        _secretLength=[_secretBooleanList count];
    }
}



#pragma  mark - Serialization mode and suffixes


/**
 *  Returns the wattSerializationMode by parsing the path suffix
 *
 *  @param path the path
 *
 *  @return the serialization mode
 */
- (WattSerializationMode)serializationModeFromRegistryFilePath:(NSString*)path{
    NSArray *suffixes=[self _suffixes];
    if([path.pathExtension isEqualToString:[suffixes objectAtIndex:3]]){
        return WattP;
    }
    if([path.pathExtension isEqualToString:[suffixes objectAtIndex:2]]){
        return WattPx;
    }
    if([path.pathExtension isEqualToString:[suffixes objectAtIndex:1]]){
        return WattJ;
    }
    return WattJx;
}

/**
 *  Returns the suffix according to the serialization mode
 *
 *  @param mode the serialization mode
 *
 *  @return the suffix
 */
- (NSString*)suffixFor:(WattSerializationMode)mode{
    return [[[self _suffixes] objectAtIndex:mode] copy];
}


- (NSArray*)_suffixes{
    return @[@"jx",@"j",@"px",@"p"];
}

- (NSFileManager *)fileManager {
    if(!_fileManager){
        _fileManager=[[NSFileManager alloc] init];
        [_fileManager setDelegate:self];
    }
    return _fileManager;
}


- (NSMutableArray *)mixableExtensions {
    if(!_mixableExtensions)
        _mixableExtensions=[NSMutableArray array];
    return _mixableExtensions;
}

- (void)setMixableExtensions:(NSMutableArray *)aMixableExtensions {
    _mixableExtensions = [aMixableExtensions mutableCopy];
}


- (NSMutableArray *)forcedSoupPaths {
    if(!_forcedSoupPaths)
        _forcedSoupPaths=[NSMutableArray array];
    return _forcedSoupPaths;
}

- (void)setForcedSoupPaths:(NSMutableArray *)aForcedSoupPaths {
    _forcedSoupPaths = [aForcedSoupPaths mutableCopy];
}



- (NSString*)_filter:(NSString*)path{
#if TARGET_OS_IPHONE
    if(!path)
        return path;
    // Those filtering operations may be necessary sometimes when manipulating IOS FS.
    NSString *filtered=[[path copy] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    filtered=[filtered stringByReplacingOccurrencesOfString:@"file:///private" withString:@""];
    filtered=[filtered stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    return filtered;
#else
    return path;
#endif
}



#pragma mark - NSFileManagerDelegate


- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error copyingItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath{
    if ([error code] == NSFileWriteFileExistsError)
        return YES;
    else
        return NO;
}
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error copyingItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL{
    if ([error code] == NSFileWriteFileExistsError)
        return YES;
    else
        return NO;
    
}

- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error movingItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath{
    if ([error code] == NSFileWriteFileExistsError)
        return YES;
    else
        return NO;
    
}
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error movingItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL{
    if ([error code] == NSFileWriteFileExistsError)
        return YES;
    else
        return NO;
    
}



@end