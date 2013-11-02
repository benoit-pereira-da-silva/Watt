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
//  WTMMenuSection.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMMenuSection.h" 
#import "WTMCollectionOfMenu.h"
#import "WTMShelf.h"

@implementation WTMMenuSection 

@synthesize details=_details;
@synthesize index=_index;
@synthesize label=_label;
@synthesize menus=_menus;
@synthesize shelf=_shelf;


#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry{
	WTMMenuSection *instance=[super wattCopyInRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_details=[_details copy];
	instance->_index=_index;
	instance->_label=[_label copy];
	instance->_menus=[_menus instancebyCopyTo:destinationRegistry];
	instance->_shelf=[_shelf instancebyCopyTo:destinationRegistry];
    return instance;
}

#pragma  mark WattExtraction

- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry{
	WTMMenuSection *instance=[super wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_details=[_details copy];
	instance->_index=_index;
	instance->_label=[_label copy];
	instance->_menus=[_menus extractInstancebyCopyTo:destinationRegistry];
	instance->_shelf=nil;// Non extractible
    return instance;
}




#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"details"]){
		[super setValue:value forKey:@"details"];
	} else if ([key isEqualToString:@"index"]) {
		[super setValue:value forKey:@"index"];
	} else if ([key isEqualToString:@"label"]) {
		[super setValue:value forKey:@"label"];
	} else if ([key isEqualToString:@"menus"]) {
		[super setValue:[WTMCollectionOfMenu instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"menus"];
	} else if ([key isEqualToString:@"shelf"]) {
		[super setValue:[WTMShelf instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"shelf"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMCollectionOfMenu*)menus{
	if([_menus isAnAlias]){
		id o=[_registry objectWithUinstID:_menus.uinstID];
		if(o){
			_menus=o;
		}
	}
	return _menus;
}


- (WTMCollectionOfMenu*)menus_auto{
	_menus=[self menus];
	if(!_menus){
		_menus=[[WTMCollectionOfMenu alloc] initInRegistry:_registry];
	}
	return _menus;
}

- (void)setMenus:(WTMCollectionOfMenu*)menus{
	_menus=menus;
}

- (WTMShelf*)shelf{
	if([_shelf isAnAlias]){
		id o=[_registry objectWithUinstID:_shelf.uinstID];
		if(o){
			_shelf=o;
		}
	}
	return _shelf;
}


- (WTMShelf*)shelf_auto{
	_shelf=[self shelf];
	if(!_shelf){
		_shelf=[[WTMShelf alloc] initInRegistry:_registry];
	}
	return _shelf;
}

- (void)setShelf:(WTMShelf*)shelf{
	_shelf=shelf;
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
	[dictionary setValue:self.details forKey:@"details"];
	[dictionary setValue:@(self.index) forKey:@"index"];
	[dictionary setValue:self.label forKey:@"label"];
	if(self.menus){
		if(includeChildren){
			[dictionary setValue:[self.menus dictionaryRepresentationWithChildren:includeChildren] forKey:@"menus"];
		}else{
			[dictionary setValue:[self.menus aliasDictionaryRepresentation] forKey:@"menus"];
		}
	}
	if(self.shelf){
		if(includeChildren){
			[dictionary setValue:[self.shelf dictionaryRepresentationWithChildren:includeChildren] forKey:@"shelf"];
		}else{
			[dictionary setValue:[self.shelf aliasDictionaryRepresentation] forKey:@"shelf"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WTMMenuSection ",self.uinstID];
	[s appendFormat:@"details : %@\n",self.details];
	[s appendFormat:@"index : %@\n",@(self.index)];
	[s appendFormat:@"label : %@\n",self.label];
	[s appendFormat:@"menus : %@\n",NSStringFromClass([self.menus class])];
	[s appendFormat:@"shelf : %@\n",NSStringFromClass([self.shelf class])];
	return s;
}

@end
