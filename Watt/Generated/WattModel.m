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
#import "WattCollectionOfReference.h"

@implementation WattModel 

@synthesize category=_category;
@synthesize comment=_comment;
@synthesize groupID=_groupID;
@synthesize metadata=_metadata;
@synthesize objectName=_objectName;
@synthesize ownerID=_ownerID;
@synthesize rights=_rights;
@synthesize references=_references;


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
	instance->_references=[_references instancebyCopyTo:destinationRegistry];
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
	instance->_references=[_references extractInstancebyCopyTo:destinationRegistry];
    return instance;
}




#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"a"]){
		[super setValue:value forKey:@"a"];
	} else if ([key isEqualToString:@"b"]) {
		[super setValue:value forKey:@"b"];
	} else if ([key isEqualToString:@"c"]) {
		[super setValue:value forKey:@"c"];
	} else if ([key isEqualToString:@"d"]) {
		[super setValue:value forKey:@"d"];
	} else if ([key isEqualToString:@"e"]) {
		[super setValue:value forKey:@"e"];
	} else if ([key isEqualToString:@"f"]) {
		[super setValue:value forKey:@"f"];
	} else if ([key isEqualToString:@"g"]) {
		[super setValue:value forKey:@"g"];
	} else if ([key isEqualToString:@"h"]) {
		[super setValue:[WattCollectionOfReference instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"h"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WattCollectionOfReference*)references{
	if([_references isAnAlias]){
		id o=[_registry objectWithUinstID:_references.uinstID];
		if(o){
			_references=o;
		}
	}
	return _references;
}


- (WattCollectionOfReference*)references_auto{
	_references=[self references];
	if(!_references){
		_references=[[WattCollectionOfReference alloc] initInRegistry:_registry];
	}
	return _references;
}

- (void)setReferences:(WattCollectionOfReference*)references{
	_references=references;
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
	if(_category){
		[dictionary setValue:self.category forKey:@"a"];
	}
	if(_comment){
		[dictionary setValue:self.comment forKey:@"b"];
	}
	[dictionary setValue:@(self.groupID) forKey:@"c"];
	if(_metadata){
		[dictionary setValue:self.metadata forKey:@"d"];
	}
	if(_objectName){
		[dictionary setValue:self.objectName forKey:@"e"];
	}
	[dictionary setValue:@(self.ownerID) forKey:@"f"];
	[dictionary setValue:@(self.rights) forKey:@"g"];
	if(_references){
		if(includeChildren){
			[dictionary setValue:[self.references dictionaryRepresentationWithChildren:includeChildren] forKey:@"h"];
		}else{
			[dictionary setValue:[self.references aliasDictionaryRepresentation] forKey:@"h"];
		}
	}
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
	[s appendFormat:@"references : %@\n",NSStringFromClass([self.references class])];
	return s;
}

@end
