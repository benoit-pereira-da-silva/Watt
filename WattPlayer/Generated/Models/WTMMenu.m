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
//  WTMMenu.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMMenu.h" 
#import "WTMCollectionOfMenu.h"
#import "WTMMenuSection.h"
#import "WTMMenu.h"
#import "WTMImage.h"

@implementation WTMMenu 

@synthesize details=_details;
@synthesize extras=_extras;
@synthesize label=_label;
@synthesize referenceUinstID=_referenceUinstID;
@synthesize urlString=_urlString;
@synthesize childrens=_childrens;
@synthesize menuSection=_menuSection;
@synthesize parent=_parent;
@synthesize picture=_picture;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"details"]){
		[super setValue:value forKey:@"details"];
	} else if ([key isEqualToString:@"extras"]) {
		[super setValue:value forKey:@"extras"];
	} else if ([key isEqualToString:@"label"]) {
		[super setValue:value forKey:@"label"];
	} else if ([key isEqualToString:@"referenceUinstID"]) {
		[super setValue:value forKey:@"referenceUinstID"];
	} else if ([key isEqualToString:@"urlString"]) {
		[super setValue:value forKey:@"urlString"];
	} else if ([key isEqualToString:@"childrens"]) {
		[super setValue:[WTMCollectionOfMenu instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"childrens"];
	} else if ([key isEqualToString:@"menuSection"]) {
		[super setValue:[WTMMenuSection instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"menuSection"];
	} else if ([key isEqualToString:@"parent"]) {
		[super setValue:[WTMMenu instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"parent"];
	} else if ([key isEqualToString:@"picture"]) {
		[super setValue:[WTMImage instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"picture"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMCollectionOfMenu*)childrens{
	if([_childrens isAnAlias]){
		id o=[_registry objectWithUinstID:_childrens.uinstID];
		if(o){
			_childrens=o;
		}
	}
	return _childrens;
}


- (WTMCollectionOfMenu*)childrens_auto{
	_childrens=[self childrens];
	if(!_childrens){
		_childrens=[[WTMCollectionOfMenu alloc] initInRegistry:_registry];
	}
	return _childrens;
}

- (void)setChildrens:(WTMCollectionOfMenu*)childrens{
	_childrens=childrens;
}

- (WTMMenuSection*)menuSection{
	if([_menuSection isAnAlias]){
		id o=[_registry objectWithUinstID:_menuSection.uinstID];
		if(o){
			_menuSection=o;
		}
	}
	return _menuSection;
}


- (WTMMenuSection*)menuSection_auto{
	_menuSection=[self menuSection];
	if(!_menuSection){
		_menuSection=[[WTMMenuSection alloc] initInRegistry:_registry];
	}
	return _menuSection;
}

- (void)setMenuSection:(WTMMenuSection*)menuSection{
	_menuSection=menuSection;
}

- (WTMMenu*)parent{
	if([_parent isAnAlias]){
		id o=[_registry objectWithUinstID:_parent.uinstID];
		if(o){
			_parent=o;
		}
	}
	return _parent;
}


- (WTMMenu*)parent_auto{
	_parent=[self parent];
	if(!_parent){
		_parent=[[WTMMenu alloc] initInRegistry:_registry];
	}
	return _parent;
}

- (void)setParent:(WTMMenu*)parent{
	_parent=parent;
}

- (WTMImage*)picture{
	if([_picture isAnAlias]){
		id o=[_registry objectWithUinstID:_picture.uinstID];
		if(o){
			_picture=o;
		}
	}
	return _picture;
}


- (WTMImage*)picture_auto{
	_picture=[self picture];
	if(!_picture){
		_picture=[[WTMImage alloc] initInRegistry:_registry];
	}
	return _picture;
}

- (void)setPicture:(WTMImage*)picture{
	_picture=picture;
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
	[dictionary setValue:self.extras forKey:@"extras"];
	[dictionary setValue:self.label forKey:@"label"];
	[dictionary setValue:[NSNumber numberWithInteger:self.referenceUinstID] forKey:@"referenceUinstID"];
	[dictionary setValue:self.urlString forKey:@"urlString"];
	if(self.childrens){
		if(includeChildren){
			[dictionary setValue:[self.childrens dictionaryRepresentationWithChildren:includeChildren] forKey:@"childrens"];
		}else{
			[dictionary setValue:[self.childrens aliasDictionaryRepresentation] forKey:@"childrens"];
		}
	}
	if(self.menuSection){
		if(includeChildren){
			[dictionary setValue:[self.menuSection dictionaryRepresentationWithChildren:includeChildren] forKey:@"menuSection"];
		}else{
			[dictionary setValue:[self.menuSection aliasDictionaryRepresentation] forKey:@"menuSection"];
		}
	}
	if(self.parent){
		if(includeChildren){
			[dictionary setValue:[self.parent dictionaryRepresentationWithChildren:includeChildren] forKey:@"parent"];
		}else{
			[dictionary setValue:[self.parent aliasDictionaryRepresentation] forKey:@"parent"];
		}
	}
	if(self.picture){
		if(includeChildren){
			[dictionary setValue:[self.picture dictionaryRepresentationWithChildren:includeChildren] forKey:@"picture"];
		}else{
			[dictionary setValue:[self.picture aliasDictionaryRepresentation] forKey:@"picture"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ :\n",NSStringFromClass([self class])];
	[s appendFormat:@"details : %@\n",self.details];
	[s appendFormat:@"extras : %@\n",self.extras];
	[s appendFormat:@"label : %@\n",self.label];
	[s appendFormat:@"referenceUinstID : %@\n",[NSNumber numberWithInteger:self.referenceUinstID]];
	[s appendFormat:@"urlString : %@\n",self.urlString];
	[s appendFormat:@"childrens : %@\n",NSStringFromClass([self.childrens class])];
	[s appendFormat:@"menuSection : %@\n",NSStringFromClass([self.menuSection class])];
	[s appendFormat:@"parent : %@\n",NSStringFromClass([self.parent class])];
	[s appendFormat:@"picture : %@\n",NSStringFromClass([self.picture class])];
	return s;
}

@end
