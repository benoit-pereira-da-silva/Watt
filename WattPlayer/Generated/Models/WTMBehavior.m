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

+ (WTMBehavior*)instanceFromDictionary:(NSDictionary *)aDictionary{
	WTMBehavior*instance = nil;
	if([aDictionary objectForKey:@"className"] && [aDictionary objectForKey:@"properties"]){
		Class theClass=NSClassFromString([aDictionary objectForKey:@"className"]);
		id unCasted= [[theClass alloc] init];
		[unCasted setAttributesFromDictionary:[aDictionary objectForKey:@"properties"]];
		instance=(WTMBehavior*)unCasted;
	}
	return instance;
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
	if (![aDictionary isKindOfClass:[NSDictionary class]]) {
		return;
	}
	[self setValuesForKeysWithDictionary:aDictionary];
}

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"comment"]){
		[super setValue:value forKey:@"comment"];
	} else if ([key isEqualToString:@"action"]) {
		[super setValue:[WTMAction instanceFromDictionary:value] forKey:@"action"];
	} else if ([key isEqualToString:@"trigger"]) {
		[super setValue:[WTMRule instanceFromDictionary:value] forKey:@"trigger"];
	} else {
		[super setValue:value forUndefinedKey:key];
	}
}

- (NSDictionary*)dictionaryRepresentation{
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
	[dictionary setValue:self.comment forKey:@"comment"];
	[dictionary setValue:[self.action dictionaryRepresentation] forKey:@"action"];
	[dictionary setValue:[self.trigger dictionaryRepresentation] forKey:@"trigger"];
	[wrapper setObject:NSStringFromClass([self class]) forKey:@"className"];
    [wrapper setObject:dictionary forKey:@"properties"];
    return wrapper;
}

-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"action : %@\n",self.action];
	[s appendFormat:@"trigger : %@\n",self.trigger];
	return s;
}

@end
