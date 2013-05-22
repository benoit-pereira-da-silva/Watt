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
//  WTMActivity.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMActivity.h" 
#import "WTMCollectionOfScene.h"

@implementation WTMActivity 


-(id)initInRegistry:(WattRegistry*)registry{
    self=[super initInRegistry:registry];
    if(self){
		self.scenes=[[WTMCollectionOfScene alloc] initInRegistry:registry];
   
    }
    return self;
}

- (WTMActivity *)localized{
    [self localize];
    return self;
}


+ (WTMActivity*)instanceFromDictionary:(NSDictionary *)aDictionary inRegistry:(WattRegistry*)registry{
	WTMActivity*instance = nil;
	NSInteger wtuinstID=[[aDictionary objectForKey:__uinstID__] integerValue];
     if(wtuinstID<=[registry count]){
        return (WTMActivity*)[registry objectWithUinstID:wtuinstID];
    }
	if([aDictionary objectForKey:__className__] && [aDictionary objectForKey:__properties__]){
		Class theClass=NSClassFromString([aDictionary objectForKey:__className__]);
		id unCasted= [[theClass alloc] initInRegistry:registry];
		[unCasted setAttributesFromDictionary:aDictionary];
		instance=(WTMActivity*)unCasted;
		[registry registerObject:instance];
	}
	return instance;
}


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"comment"]){
		[super setValue:value forKey:@"comment"];
	} else if ([key isEqualToString:@"controllerClass"]) {
		[super setValue:value forKey:@"controllerClass"];
	} else if ([key isEqualToString:@"level"]) {
		[super setValue:value forKey:@"level"];
	} else if ([key isEqualToString:@"ownerUserUID"]) {
		[super setValue:value forKey:@"ownerUserUID"];
	} else if ([key isEqualToString:@"packageIndex"]) {
		[super setValue:value forKey:@"packageIndex"];
	} else if ([key isEqualToString:@"rating"]) {
		[super setValue:value forKey:@"rating"];
	} else if ([key isEqualToString:@"rights"]) {
		[super setValue:value forKey:@"rights"];
	} else if ([key isEqualToString:@"shortName"]) {
		[super setValue:value forKey:@"shortName"];
	} else if ([key isEqualToString:@"title"]) {
		[super setValue:value forKey:@"title"];
	} else if ([key isEqualToString:@"uid"]) {
		[super setValue:value forKey:@"uid"];
	} else if ([key isEqualToString:@"scenes"]) {
		[super setValue:[WTMCollectionOfScene instanceFromDictionary:value inRegistry:_registry] forKey:@"scenes"];
	} else {
		[super setValue:value forKey:key];
	}
}

/*
// @todo implement the default values? 
- (void)setNilValueForKey:(NSString *)theKey{
    if ([theKey isEqualToString:@"age"]) {
        [self setValue:[NSNumber numberWithFloat:0.0] forKey:@"age"];
    } else
        [super setNilValueForKey:theKey];
}

//@todo implement the validation process
-(BOOL)validateName:(id *)ioValue error:(NSError * __autoreleasing *)outError{
 
    // The name must not be nil, and must be at least two characters long.
    if ((*ioValue == nil) || ([(NSString *)*ioValue length] < 2)) {
        if (outError != NULL) {
            NSString *errorString = NSLocalizedString(
                    @"A Person's name must be at least two characters long",
                    @"validation: Person, too short name error");
            NSDictionary *userInfoDict = @{ NSLocalizedDescriptionKey : errorString };
            *outError = [[NSError alloc] initWithDomain:@"PERSON_ERROR_DOMAIN"
                                                    code:1//PERSON_INVALID_NAME_CODE
                                                userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}
*/


- (NSDictionary*)dictionaryRepresentation{
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
	[dictionary setValue:self.comment forKey:@"comment"];
	[dictionary setValue:self.controllerClass forKey:@"controllerClass"];
	[dictionary setValue:[NSNumber numberWithInteger:self.level] forKey:@"level"];
	[dictionary setValue:self.ownerUserUID forKey:@"ownerUserUID"];
	[dictionary setValue:[NSNumber numberWithInteger:self.packageIndex] forKey:@"packageIndex"];
	[dictionary setValue:[NSNumber numberWithInteger:self.rating] forKey:@"rating"];
	[dictionary setValue:self.rights forKey:@"rights"];
	[dictionary setValue:self.shortName forKey:@"shortName"];
	[dictionary setValue:self.title forKey:@"title"];
	[dictionary setValue:self.uid forKey:@"uid"];
	[dictionary setValue:[self.scenes dictionaryRepresentation] forKey:@"scenes"];
	[wrapper setObject:NSStringFromClass([self class]) forKey:__className__];
    [wrapper setObject:dictionary forKey:__properties__];
    [wrapper setObject:[NSNumber numberWithInteger:self.uinstID] forKey:__uinstID__];
    return wrapper;
}

-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ :\n",NSStringFromClass([self class])];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"controllerClass : %@\n",self.controllerClass];
	[s appendFormat:@"level : %@\n",[NSNumber numberWithInteger:self.level]];
	[s appendFormat:@"ownerUserUID : %@\n",self.ownerUserUID];
	[s appendFormat:@"packageIndex : %@\n",[NSNumber numberWithInteger:self.packageIndex]];
	[s appendFormat:@"rating : %@\n",[NSNumber numberWithInteger:self.rating]];
	[s appendFormat:@"rights : %@\n",self.rights];
	[s appendFormat:@"shortName : %@\n",self.shortName];
	[s appendFormat:@"title : %@\n",self.title];
	[s appendFormat:@"uid : %@\n",self.uid];
	[s appendFormat:@"scenes : %@\n",self.scenes];
	return s;
}

@end
