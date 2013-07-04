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
//  WTMElement.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMElement.h" 
#import "WTMAsset.h"
#import "WTMBehavior.h"
#import "WTMScene.h"

@implementation WTMElement 

@synthesize category=_category;
@synthesize controllerClass=_controllerClass;
@synthesize extras=_extras;
@synthesize rect=_rect;
@synthesize rights=_rights;
@synthesize asset=_asset;
@synthesize behavior=_behavior;
@synthesize scene=_scene;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"category"]){
		[super setValue:value forKey:@"category"];
	} else if ([key isEqualToString:@"controllerClass"]) {
		[super setValue:value forKey:@"controllerClass"];
	} else if ([key isEqualToString:@"extras"]) {
		[super setValue:value forKey:@"extras"];
	} else if ([key isEqualToString:@"rect"]) {
		[super setValue:value forKey:@"rect"];
	} else if ([key isEqualToString:@"rights"]) {
		[super setValue:value forKey:@"rights"];
	} else if ([key isEqualToString:@"asset"]) {
		[super setValue:[WTMAsset instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"asset"];
	} else if ([key isEqualToString:@"behavior"]) {
		[super setValue:[WTMBehavior instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"behavior"];
	} else if ([key isEqualToString:@"scene"]) {
		[super setValue:[WTMScene instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"scene"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMAsset*)asset{
	if([_asset isAnAlias]){
		id o=[_registry objectWithUinstID:_asset.uinstID];
		if(o){
			_asset=o;
		}
	}
	return _asset;
}


- (WTMAsset*)asset_auto{
	_asset=[self asset];
	if(!_asset){
		_asset=[[WTMAsset alloc] initInRegistry:_registry];
	}
	return _asset;
}

- (void)setAsset:(WTMAsset*)asset{
	_asset=asset;
}

- (WTMBehavior*)behavior{
	if([_behavior isAnAlias]){
		id o=[_registry objectWithUinstID:_behavior.uinstID];
		if(o){
			_behavior=o;
		}
	}
	return _behavior;
}


- (WTMBehavior*)behavior_auto{
	_behavior=[self behavior];
	if(!_behavior){
		_behavior=[[WTMBehavior alloc] initInRegistry:_registry];
	}
	return _behavior;
}

- (void)setBehavior:(WTMBehavior*)behavior{
	_behavior=behavior;
}

- (WTMScene*)scene{
	if([_scene isAnAlias]){
		id o=[_registry objectWithUinstID:_scene.uinstID];
		if(o){
			_scene=o;
		}
	}
	return _scene;
}


- (WTMScene*)scene_auto{
	_scene=[self scene];
	if(!_scene){
		_scene=[[WTMScene alloc] initInRegistry:_registry];
	}
	return _scene;
}

- (void)setScene:(WTMScene*)scene{
	_scene=scene;
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
	[dictionary setValue:self.controllerClass forKey:@"controllerClass"];
	[dictionary setValue:self.extras forKey:@"extras"];
	[dictionary setValue:self.rect forKey:@"rect"];
	[dictionary setValue:self.rights forKey:@"rights"];
	if(self.asset){
		if(includeChildren){
			[dictionary setValue:[self.asset dictionaryRepresentationWithChildren:includeChildren] forKey:@"asset"];
		}else{
			[dictionary setValue:[self.asset aliasDictionaryRepresentation] forKey:@"asset"];
		}
	}
	if(self.behavior){
		if(includeChildren){
			[dictionary setValue:[self.behavior dictionaryRepresentationWithChildren:includeChildren] forKey:@"behavior"];
		}else{
			[dictionary setValue:[self.behavior aliasDictionaryRepresentation] forKey:@"behavior"];
		}
	}
	if(self.scene){
		if(includeChildren){
			[dictionary setValue:[self.scene dictionaryRepresentationWithChildren:includeChildren] forKey:@"scene"];
		}else{
			[dictionary setValue:[self.scene aliasDictionaryRepresentation] forKey:@"scene"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ :\n",NSStringFromClass([self class])];
	[s appendFormat:@"category : %@\n",self.category];
	[s appendFormat:@"controllerClass : %@\n",self.controllerClass];
	[s appendFormat:@"extras : %@\n",self.extras];
	[s appendFormat:@"rect : %@\n",self.rect];
	[s appendFormat:@"rights : %@\n",self.rights];
	[s appendFormat:@"asset : %@\n",NSStringFromClass([self.asset class])];
	[s appendFormat:@"behavior : %@\n",NSStringFromClass([self.behavior class])];
	[s appendFormat:@"scene : %@\n",NSStringFromClass([self.scene class])];
	return s;
}

@end
