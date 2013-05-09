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
//  WTMPackage.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMPackage.h" 
#import "WTMCollectionOfActivity.h"
#import "WTMCollectionOfLangDictionary.h"
#import "WTMCollectionOfLibrary.h"
#import "WTMCollectionOfUser.h"

@implementation WTMPackage 

+ (WTMPackage*)instanceFromDictionary:(NSDictionary *)aDictionary{
	WTMPackage*instance = nil;
	if([aDictionary objectForKey:@"className"] && [aDictionary objectForKey:@"properties"]){
		Class theClass=NSClassFromString([aDictionary objectForKey:@"className"]);
		id unCasted= [[theClass alloc] init];
		[unCasted setAttributesFromDictionary:[aDictionary objectForKey:@"properties"]];
		instance=(WTMPackage*)unCasted;
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
	} else if ([key isEqualToString:@"license"]) {
		[super setValue:value forKey:@"license"];
	} else if ([key isEqualToString:@"minEngineVersion"]) {
		[super setValue:value forKey:@"minEngineVersion"];
	} else if ([key isEqualToString:@"name"]) {
		[super setValue:value forKey:@"name"];
	} else if ([key isEqualToString:@"ownerUserUID"]) {
		[super setValue:value forKey:@"ownerUserUID"];
	} else if ([key isEqualToString:@"rights"]) {
		[super setValue:value forKey:@"rights"];
	} else if ([key isEqualToString:@"shelfIndex"]) {
		[super setValue:value forKey:@"shelfIndex"];
	} else if ([key isEqualToString:@"uid"]) {
		[super setValue:value forKey:@"uid"];
	} else if ([key isEqualToString:@"activities"]) {
		[super setValue:[WTMCollectionOfActivity instanceFromDictionary:value] forKey:@"activities"];
	} else if ([key isEqualToString:@"langDictionaries"]) {
		[super setValue:[WTMCollectionOfLangDictionary instanceFromDictionary:value] forKey:@"langDictionaries"];
	} else if ([key isEqualToString:@"libraries"]) {
		[super setValue:[WTMCollectionOfLibrary instanceFromDictionary:value] forKey:@"libraries"];
	} else if ([key isEqualToString:@"rightsAssignees"]) {
		[super setValue:[WTMCollectionOfUser instanceFromDictionary:value] forKey:@"rightsAssignees"];
	} else {
		[super setValue:value forUndefinedKey:key];
	}
}

- (NSDictionary*)dictionaryRepresentation{
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
	[dictionary setValue:self.comment forKey:@"comment"];
	[dictionary setValue:self.license forKey:@"license"];
	[dictionary setValue:[NSNumber numberWithFloat:self.minEngineVersion] forKey:@"minEngineVersion"];
	[dictionary setValue:self.name forKey:@"name"];
	[dictionary setValue:self.ownerUserUID forKey:@"ownerUserUID"];
	[dictionary setValue:self.rights forKey:@"rights"];
	[dictionary setValue:[NSNumber numberWithInteger:self.shelfIndex] forKey:@"shelfIndex"];
	[dictionary setValue:self.uid forKey:@"uid"];
	[dictionary setValue:[self.activities dictionaryRepresentation] forKey:@"activities"];
	[dictionary setValue:[self.langDictionaries dictionaryRepresentation] forKey:@"langDictionaries"];
	[dictionary setValue:[self.libraries dictionaryRepresentation] forKey:@"libraries"];
	[dictionary setValue:[self.rightsAssignees dictionaryRepresentation] forKey:@"rightsAssignees"];
	[wrapper setObject:NSStringFromClass([self class]) forKey:@"className"];
    [wrapper setObject:dictionary forKey:@"properties"];
    return wrapper;
}

-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"license : %@\n",self.license];
	[s appendFormat:@"minEngineVersion : %@\n",[NSNumber numberWithFloat:self.minEngineVersion]];
	[s appendFormat:@"name : %@\n",self.name];
	[s appendFormat:@"ownerUserUID : %@\n",self.ownerUserUID];
	[s appendFormat:@"rights : %@\n",self.rights];
	[s appendFormat:@"shelfIndex : %@\n",[NSNumber numberWithInteger:self.shelfIndex]];
	[s appendFormat:@"uid : %@\n",self.uid];
	[s appendFormat:@"activities : %@\n",self.activities];
	[s appendFormat:@"langDictionaries : %@\n",self.langDictionaries];
	[s appendFormat:@"libraries : %@\n",self.libraries];
	[s appendFormat:@"rightsAssignees : %@\n",self.rightsAssignees];
	return s;
}

@end
