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
//  WTMScene.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMScene.h" 
#import "WTMCollectionOfElement.h"

@implementation WTMScene 


-(id)init{
    self=[super init];
    if(self){
		self.elements=[[WTMCollectionOfElement alloc] init];
   
    }
    return self;
}

- (WTMScene *)localized{
    [self localize];
    return self;
}


+ (WTMScene*)instanceFromDictionary:(NSDictionary *)aDictionary{
	WTMScene*instance = nil;
	NSInteger wtuinstID=[[aDictionary objectForKey:__uinstID__] integerValue];
    if(wtuinstID>0){
        return (WTMScene*)[[wattMAPI defaultRegistry] objectWithUinstID:wtuinstID];
    }
	if([aDictionary objectForKey:__className__] && [aDictionary objectForKey:__properties__]){
		Class theClass=NSClassFromString([aDictionary objectForKey:__className__]);
		id unCasted= [[theClass alloc] init];
		[unCasted setAttributesFromDictionary:aDictionary];
		instance=(WTMScene*)unCasted;
	}
	return instance;
}


- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
	if (![aDictionary isKindOfClass:[NSDictionary class]]) {
		return;
	}
    if([aDictionary objectForKey:__className__] && [aDictionary objectForKey:__properties__]){
        id properties=[aDictionary objectForKey:__properties__];
        NSString *selfClassName=NSStringFromClass([self class]);
        if (![selfClassName isEqualToString:[aDictionary objectForKey:__className__]]) {
             [NSException raise:@"WTMAttributesException" format:@"selfClassName %@ is not a %@ ",selfClassName,[aDictionary objectForKey:__className__]];
        }
        if([properties isKindOfClass:[NSDictionary class]]){
            for (NSString *key in properties) {
                id value=[properties objectForKey:key];
                if(value)
                    [self setValue:value forKey:key];
            }
        }else{
            [NSException raise:@"WTMAttributesException" format:@"properties is not a NSDictionary"];
        }
    }else{
        [self setValuesForKeysWithDictionary:aDictionary];
    }
}




- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"activityIndex"]){
		[super setValue:value forKey:@"activityIndex"];
	} else if ([key isEqualToString:@"comment"]) {
		[super setValue:value forKey:@"comment"];
	} else if ([key isEqualToString:@"controllerClass"]) {
		[super setValue:value forKey:@"controllerClass"];
	} else if ([key isEqualToString:@"number"]) {
		[super setValue:value forKey:@"number"];
	} else if ([key isEqualToString:@"ownerUserUID"]) {
		[super setValue:value forKey:@"ownerUserUID"];
	} else if ([key isEqualToString:@"rect"]) {
		[super setValue:value forKey:@"rect"];
	} else if ([key isEqualToString:@"rights"]) {
		[super setValue:value forKey:@"rights"];
	} else if ([key isEqualToString:@"title"]) {
		[super setValue:value forKey:@"title"];
	} else if ([key isEqualToString:@"uid"]) {
		[super setValue:value forKey:@"uid"];
	} else if ([key isEqualToString:@"elements"]) {
		[super setValue:[WTMCollectionOfElement instanceFromDictionary:value] forKey:@"elements"];
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
	[dictionary setValue:[NSNumber numberWithInteger:self.activityIndex] forKey:@"activityIndex"];
	[dictionary setValue:self.comment forKey:@"comment"];
	[dictionary setValue:self.controllerClass forKey:@"controllerClass"];
	[dictionary setValue:[NSNumber numberWithInteger:self.number] forKey:@"number"];
	[dictionary setValue:self.ownerUserUID forKey:@"ownerUserUID"];
	[dictionary setValue:[NSValue valueWithCGRect:self.rect] forKey:@"rect"];
	[dictionary setValue:self.rights forKey:@"rights"];
	[dictionary setValue:self.title forKey:@"title"];
	[dictionary setValue:self.uid forKey:@"uid"];
	[dictionary setValue:[self.elements dictionaryRepresentation] forKey:@"elements"];
	[wrapper setObject:NSStringFromClass([self class]) forKey:__className__];
    [wrapper setObject:dictionary forKey:__properties__];
    [wrapper setObject:[NSNumber numberWithInteger:self.uinstID] forKey:__uinstID__];
    return wrapper;
}

-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"activityIndex : %@\n",[NSNumber numberWithInteger:self.activityIndex]];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"controllerClass : %@\n",self.controllerClass];
	[s appendFormat:@"number : %@\n",[NSNumber numberWithInteger:self.number]];
	[s appendFormat:@"ownerUserUID : %@\n",self.ownerUserUID];
	[s appendFormat:@"rect : %@\n",[NSValue valueWithCGRect:self.rect]];
	[s appendFormat:@"rights : %@\n",self.rights];
	[s appendFormat:@"title : %@\n",self.title];
	[s appendFormat:@"uid : %@\n",self.uid];
	[s appendFormat:@"elements : %@\n",self.elements];
	return s;
}

@end
