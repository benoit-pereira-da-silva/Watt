// This file is part of "WTM"
// 
// "WTM" is free software: you can redistribute it and/or modify
// it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// "WTM" is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU LESSER GENERAL PUBLIC LICENSE for more details.
// 
// You should have received a copy of the GNU LESSER GENERAL PUBLIC LICENSE
// along with "WTM"  If not, see <http://www.gnu.org/licenses/>
// 
//  WTMLibrary.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMLibrary.h" 
#import "WTMCollectionOfBand.h"
#import "WTMCollectionOfMember.h"
#import "WTMPackage.h"

@implementation WTMLibrary 

@synthesize name=_name;
@synthesize bands=_bands;
@synthesize members=_members;
@synthesize package=_package;


#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry{
	WTMLibrary *instance=[super wattCopyInRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_name=[_name copy];
	instance->_bands=[_bands instancebyCopyTo:destinationRegistry];
	instance->_members=[_members instancebyCopyTo:destinationRegistry];
	instance->_package=[_package instancebyCopyTo:destinationRegistry];
    return instance;
}

#pragma  mark WattExtraction

- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry{
	WTMLibrary *instance=[super wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_name=[_name copy];
	instance->_bands=[_bands wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_members=[_members wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_package=nil;// Non extractible
    return instance;
}




#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"name"]){
		[super setValue:value forKey:@"name"];
	} else if ([key isEqualToString:@"bands"]) {
		[super setValue:[WTMCollectionOfBand instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"bands"];
	} else if ([key isEqualToString:@"members"]) {
		[super setValue:[WTMCollectionOfMember instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"members"];
	} else if ([key isEqualToString:@"package"]) {
		[super setValue:[WTMPackage instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"package"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMCollectionOfBand*)bands{
	if([_bands isAnAlias]){
		id o=[_registry objectWithUinstID:_bands.uinstID];
		if(o){
			_bands=o;
		}
	}
	return _bands;
}


- (WTMCollectionOfBand*)bands_auto{
	_bands=[self bands];
	if(!_bands){
		_bands=[[WTMCollectionOfBand alloc] initInRegistry:_registry];
	}
	return _bands;
}

- (void)setBands:(WTMCollectionOfBand*)bands{
	_bands=bands;
}

- (WTMCollectionOfMember*)members{
	if([_members isAnAlias]){
		id o=[_registry objectWithUinstID:_members.uinstID];
		if(o){
			_members=o;
		}
	}
	return _members;
}


- (WTMCollectionOfMember*)members_auto{
	_members=[self members];
	if(!_members){
		_members=[[WTMCollectionOfMember alloc] initInRegistry:_registry];
	}
	return _members;
}

- (void)setMembers:(WTMCollectionOfMember*)members{
	_members=members;
}

- (WTMPackage*)package{
	if([_package isAnAlias]){
		id o=[_registry objectWithUinstID:_package.uinstID];
		if(o){
			_package=o;
		}
	}
	return _package;
}


- (WTMPackage*)package_auto{
	_package=[self package];
	if(!_package){
		_package=[[WTMPackage alloc] initInRegistry:_registry];
	}
	return _package;
}

- (void)setPackage:(WTMPackage*)package{
	_package=package;
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
	[dictionary setValue:self.name forKey:@"name"];
	if(self.bands){
		if(includeChildren){
			[dictionary setValue:[self.bands dictionaryRepresentationWithChildren:includeChildren] forKey:@"bands"];
		}else{
			[dictionary setValue:[self.bands aliasDictionaryRepresentation] forKey:@"bands"];
		}
	}
	if(self.members){
		if(includeChildren){
			[dictionary setValue:[self.members dictionaryRepresentationWithChildren:includeChildren] forKey:@"members"];
		}else{
			[dictionary setValue:[self.members aliasDictionaryRepresentation] forKey:@"members"];
		}
	}
	if(self.package){
		if(includeChildren){
			[dictionary setValue:[self.package dictionaryRepresentationWithChildren:includeChildren] forKey:@"package"];
		}else{
			[dictionary setValue:[self.package aliasDictionaryRepresentation] forKey:@"package"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WTMLibrary ",self.uinstID];
	[s appendFormat:@"name : %@\n",self.name];
	[s appendFormat:@"bands : %@\n",NSStringFromClass([self.bands class])];
	[s appendFormat:@"members : %@\n",NSStringFromClass([self.members class])];
	[s appendFormat:@"package : %@\n",NSStringFromClass([self.package class])];
	return s;
}

@end
