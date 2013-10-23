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
//  WattUser.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WattUser.h" 
#import "WattGroup.h"

@implementation WattUser 

@synthesize identity=_identity;
@synthesize objectName=_objectName;
@synthesize group=_group;


#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)registry{
    WattUser *instance=[self copy];
    [registry addObject:instance];
    return instance;
}


// NSCopying
- (id)copyWithZone:(NSZone *)zone{
    WattUser *instance=[super copyWithZone:zone];
    	instance->_registry=nil; // We want to furnish a registry free copy
		// we do not provide an _uinstID
   			instance->_identity=[_identity copyWithZone:zone];
		instance->_objectName=[_objectName copyWithZone:zone];
		instance->_group=[_group copyWithZone:zone];
    return instance;
}

#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"identity"]){
		[super setValue:value forKey:@"identity"];
	} else if ([key isEqualToString:@"objectName"]) {
		[super setValue:value forKey:@"objectName"];
	} else if ([key isEqualToString:@"group"]) {
		[super setValue:[WattGroup instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"group"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WattGroup*)group{
	if([_group isAnAlias]){
		id o=[_registry objectWithUinstID:_group.uinstID];
		if(o){
			_group=o;
		}
	}
	return _group;
}


- (WattGroup*)group_auto{
	_group=[self group];
	if(!_group){
		_group=[[WattGroup alloc] initInRegistry:_registry];
	}
	return _group;
}

- (void)setGroup:(WattGroup*)group{
	_group=group;
}


- (NSDictionary *)dictionaryRepresentationWithChildren:(BOOL)includeChildren{
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
	[wrapper setObject:NSStringFromClass([self class]) forKey:__className__];
    [wrapper setObject:[self dictionaryOfPropertiesWithChildren:includeChildren] forKey:__properties__];
    [wrapper setObject:[NSNumber numberWithInteger:self.uinstID] forKey:__uinstID__];
    return wrapper;
}

- (NSMutableDictionary*)dictionaryOfPropertiesWithChildren:(BOOL)includeChildren{
    NSMutableDictionary *dictionary=[super dictionaryOfPropertiesWithChildren:includeChildren];
	[dictionary setValue:self.identity forKey:@"identity"];
	[dictionary setValue:self.objectName forKey:@"objectName"];
	if(self.group){
		if(includeChildren){
			[dictionary setValue:[self.group dictionaryRepresentationWithChildren:includeChildren] forKey:@"group"];
		}else{
			[dictionary setValue:[self.group aliasDictionaryRepresentation] forKey:@"group"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WattUser ",self.uinstID];
	[s appendFormat:@"identity : %@\n",self.identity];
	[s appendFormat:@"objectName : %@\n",self.objectName];
	[s appendFormat:@"group : %@\n",NSStringFromClass([self.group class])];
	return s;
}

@end
