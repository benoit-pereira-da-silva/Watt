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
//  WattModel.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WattModel.h" 

@implementation WattModel 

@synthesize category=_category;
@synthesize comment=_comment;
@synthesize groupID=_groupID;
@synthesize metadata=_metadata;
@synthesize objectName=_objectName;
@synthesize ownerID=_ownerID;
@synthesize rights=_rights;


#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry{
	WattModel *instance=[super wattCopyInRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_category=[_category copy];
	instance->_comment=[_comment copy];
	instance->_groupID=_groupID;
	instance->_metadata=[_metadata copy];
	instance->_objectName=[_objectName copy];
	instance->_ownerID=_ownerID;
	instance->_rights=_rights;
    return instance;
}

#pragma  mark WattExtraction

- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry{
	WattModel *instance=[super wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_category=[_category copy];
	instance->_comment=[_comment copy];
	instance->_groupID=_groupID;
	instance->_metadata=[_metadata copy];
	instance->_objectName=[_objectName copy];
	instance->_ownerID=_ownerID;
	instance->_rights=_rights;
    return instance;
}




#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"category"]){
		[super setValue:value forKey:@"category"];
	} else if ([key isEqualToString:@"comment"]) {
		[super setValue:value forKey:@"comment"];
	} else if ([key isEqualToString:@"groupID"]) {
		[super setValue:value forKey:@"groupID"];
	} else if ([key isEqualToString:@"metadata"]) {
		[super setValue:value forKey:@"metadata"];
	} else if ([key isEqualToString:@"objectName"]) {
		[super setValue:value forKey:@"objectName"];
	} else if ([key isEqualToString:@"ownerID"]) {
		[super setValue:value forKey:@"ownerID"];
	} else if ([key isEqualToString:@"rights"]) {
		[super setValue:value forKey:@"rights"];
	} else {
		[super setValue:value forKey:key];
	}
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
	[dictionary setValue:self.category forKey:@"category"];
	[dictionary setValue:self.comment forKey:@"comment"];
	[dictionary setValue:@(self.groupID) forKey:@"groupID"];
	[dictionary setValue:self.metadata forKey:@"metadata"];
	[dictionary setValue:self.objectName forKey:@"objectName"];
	[dictionary setValue:@(self.ownerID) forKey:@"ownerID"];
	[dictionary setValue:@(self.rights) forKey:@"rights"];
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WattModel ",self.uinstID];
	[s appendFormat:@"category : %@\n",self.category];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"groupID : %@\n",@(self.groupID)];
	[s appendFormat:@"metadata : %@\n",self.metadata];
	[s appendFormat:@"objectName : %@\n",self.objectName];
	[s appendFormat:@"ownerID : %@\n",@(self.ownerID)];
	[s appendFormat:@"rights : %@\n",@(self.rights)];
	return s;
}

@end
