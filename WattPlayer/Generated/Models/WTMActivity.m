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
//  WTMActivity.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMActivity.h" 
#import "WTMImage.h"
#import "WTMPackage.h"
#import "WTMCollectionOfScene.h"

@implementation WTMActivity 

@synthesize category=_category;
@synthesize comment=_comment;
@synthesize controllerClass=_controllerClass;
@synthesize extras=_extras;
@synthesize level=_level;
@synthesize nature=_nature;
@synthesize rating=_rating;
@synthesize rights=_rights;
@synthesize shortName=_shortName;
@synthesize title=_title;
@synthesize coverPicture=_coverPicture;
@synthesize package=_package;
@synthesize scenes=_scenes;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"category"]){
		[super setValue:value forKey:@"category"];
	} else if ([key isEqualToString:@"comment"]) {
		[super setValue:value forKey:@"comment"];
	} else if ([key isEqualToString:@"controllerClass"]) {
		[super setValue:value forKey:@"controllerClass"];
	} else if ([key isEqualToString:@"extras"]) {
		[super setValue:value forKey:@"extras"];
	} else if ([key isEqualToString:@"level"]) {
		[super setValue:value forKey:@"level"];
	} else if ([key isEqualToString:@"nature"]) {
		[super setValue:value forKey:@"nature"];
	} else if ([key isEqualToString:@"rating"]) {
		[super setValue:value forKey:@"rating"];
	} else if ([key isEqualToString:@"rights"]) {
		[super setValue:value forKey:@"rights"];
	} else if ([key isEqualToString:@"shortName"]) {
		[super setValue:value forKey:@"shortName"];
	} else if ([key isEqualToString:@"title"]) {
		[super setValue:value forKey:@"title"];
	} else if ([key isEqualToString:@"coverPicture"]) {
		[super setValue:[WTMImage instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"coverPicture"];
	} else if ([key isEqualToString:@"package"]) {
		[super setValue:[WTMPackage instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"package"];
	} else if ([key isEqualToString:@"scenes"]) {
		[super setValue:[WTMCollectionOfScene instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"scenes"];
	} else {
		[super setValue:value forKey:key];
	}
}


- (WTMImage*)coverPicture{
	if([_coverPicture isAnAlias]){
		id o=[_registry objectWithUinstID:_coverPicture.uinstID];
		if(o){
			_coverPicture=o;
		}
	}
	return _coverPicture;
}


- (WTMImage*)coverPicture_auto{
	_coverPicture=[self coverPicture];
	if(!_coverPicture){
		_coverPicture=[[WTMImage alloc] initInRegistry:_registry];
	}
	return _coverPicture;
}

- (void)setCoverPicture:(WTMImage*)coverPicture{
	_coverPicture=coverPicture;
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

- (WTMCollectionOfScene*)scenes{
	if([_scenes isAnAlias]){
		id o=[_registry objectWithUinstID:_scenes.uinstID];
		if(o){
			_scenes=o;
		}
	}
	return _scenes;
}


- (WTMCollectionOfScene*)scenes_auto{
	_scenes=[self scenes];
	if(!_scenes){
		_scenes=[[WTMCollectionOfScene alloc] initInRegistry:_registry];
	}
	return _scenes;
}

- (void)setScenes:(WTMCollectionOfScene*)scenes{
	_scenes=scenes;
}



- (NSDictionary *)dictionaryRepresentationWithChildren:(BOOL)includeChildren{
    if([self isAnAlias])
        return [super aliasDictionaryRepresentation];
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
	[dictionary setValue:self.category forKey:@"category"];
	[dictionary setValue:self.comment forKey:@"comment"];
	[dictionary setValue:self.controllerClass forKey:@"controllerClass"];
	[dictionary setValue:self.extras forKey:@"extras"];
	[dictionary setValue:[NSNumber numberWithInteger:self.level] forKey:@"level"];
	[dictionary setValue:self.nature forKey:@"nature"];
	[dictionary setValue:[NSNumber numberWithInteger:self.rating] forKey:@"rating"];
	[dictionary setValue:self.rights forKey:@"rights"];
	[dictionary setValue:self.shortName forKey:@"shortName"];
	[dictionary setValue:self.title forKey:@"title"];
	if(self.coverPicture){
		if(includeChildren){
			[dictionary setValue:[self.coverPicture dictionaryRepresentationWithChildren:includeChildren] forKey:@"coverPicture"];
		}else{
			[dictionary setValue:[self.coverPicture aliasDictionaryRepresentation] forKey:@"coverPicture"];
		}
	}
	if(self.package){
		if(includeChildren){
			[dictionary setValue:[self.package dictionaryRepresentationWithChildren:includeChildren] forKey:@"package"];
		}else{
			[dictionary setValue:[self.package aliasDictionaryRepresentation] forKey:@"package"];
		}
	}
	if(self.scenes){
		if(includeChildren){
			[dictionary setValue:[self.scenes dictionaryRepresentationWithChildren:includeChildren] forKey:@"scenes"];
		}else{
			[dictionary setValue:[self.scenes aliasDictionaryRepresentation] forKey:@"scenes"];
		}
	}
	[wrapper setObject:NSStringFromClass([self class]) forKey:__className__];
    [wrapper setObject:dictionary forKey:__properties__];
    [wrapper setObject:[NSNumber numberWithInteger:self.uinstID] forKey:__uinstID__];
    return wrapper;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ :\n",NSStringFromClass([self class])];
	[s appendFormat:@"category : %@\n",self.category];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"controllerClass : %@\n",self.controllerClass];
	[s appendFormat:@"extras : %@\n",self.extras];
	[s appendFormat:@"level : %@\n",[NSNumber numberWithInteger:self.level]];
	[s appendFormat:@"nature : %@\n",self.nature];
	[s appendFormat:@"rating : %@\n",[NSNumber numberWithInteger:self.rating]];
	[s appendFormat:@"rights : %@\n",self.rights];
	[s appendFormat:@"shortName : %@\n",self.shortName];
	[s appendFormat:@"title : %@\n",self.title];
	[s appendFormat:@"coverPicture : %@\n",NSStringFromClass([self.coverPicture class])];
	[s appendFormat:@"package : %@\n",NSStringFromClass([self.package class])];
	[s appendFormat:@"scenes : %@\n",NSStringFromClass([self.scenes class])];
	return s;
}

@end
