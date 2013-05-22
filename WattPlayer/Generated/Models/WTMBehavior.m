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
//  WTMBehavior.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMBehavior.h" 
#import "WTMAction.h"
#import "WTMRule.h"

@implementation WTMBehavior 


-(id)initInRegistry:(WattRegistry*)registry{
    self=[super initInRegistry:registry];
    if(self){
		self.action=[[WTMAction alloc] initInRegistry:registry];
		self.trigger=[[WTMRule alloc] initInRegistry:registry];
   
    }
    return self;
}

- (WTMBehavior *)localized{
    [self localize];
    return self;
}


+ (WTMBehavior*)instanceFromDictionary:(NSDictionary *)aDictionary inRegistry:(WattRegistry*)registry{
	WTMBehavior*instance = nil;
	NSInteger wtuinstID=[[aDictionary objectForKey:__uinstID__] integerValue];
     if(wtuinstID<=[registry count]){
        return (WTMBehavior*)[registry objectWithUinstID:wtuinstID];
    }
	if([aDictionary objectForKey:__className__] && [aDictionary objectForKey:__properties__]){
		Class theClass=NSClassFromString([aDictionary objectForKey:__className__]);
		id unCasted= [[theClass alloc] initInRegistry:registry];
		[unCasted setAttributesFromDictionary:aDictionary];
		instance=(WTMBehavior*)unCasted;
		[registry registerObject:instance];
	}
	return instance;
}


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"comment"]){
		[super setValue:value forKey:@"comment"];
	} else if ([key isEqualToString:@"action"]) {
		[super setValue:[WTMAction instanceFromDictionary:value inRegistry:_registry] forKey:@"action"];
	} else if ([key isEqualToString:@"trigger"]) {
		[super setValue:[WTMRule instanceFromDictionary:value inRegistry:_registry] forKey:@"trigger"];
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
	[dictionary setValue:[self.action dictionaryRepresentation] forKey:@"action"];
	[dictionary setValue:[self.trigger dictionaryRepresentation] forKey:@"trigger"];
	[wrapper setObject:NSStringFromClass([self class]) forKey:__className__];
    [wrapper setObject:dictionary forKey:__properties__];
    [wrapper setObject:[NSNumber numberWithInteger:self.uinstID] forKey:__uinstID__];
    return wrapper;
}

-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ :\n",NSStringFromClass([self class])];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"action : %@\n",self.action];
	[s appendFormat:@"trigger : %@\n",self.trigger];
	return s;
}

@end
