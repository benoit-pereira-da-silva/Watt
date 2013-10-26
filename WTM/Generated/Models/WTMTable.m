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
//  WTMTable.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMTable.h" 
#import "WTMCollectionOfColumn.h"
#import "WTMCollectionOfLine.h"
#import "WTMScene.h"

@implementation WTMTable 

@synthesize columns=_columns;
@synthesize lines=_lines;
@synthesize scene=_scene;


#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry{
	WTMTable *instance=[super wattCopyInRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_columns=[_columns instancebyCopyTo:destinationRegistry];
	instance->_lines=[_lines instancebyCopyTo:destinationRegistry];
	instance->_scene=[_scene instancebyCopyTo:destinationRegistry];
    return instance;
}

#pragma  mark WattExtraction

- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry{
	WTMTable *instance=[super wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_columns=[_columns wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_lines=[_lines wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_scene=[_scene wattExtractAndCopyToRegistry:destinationRegistry];
    return instance;
}




#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"columns"]){
		[super setValue:[WTMCollectionOfColumn instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"columns"];
	} else if ([key isEqualToString:@"lines"]) {
		[super setValue:[WTMCollectionOfLine instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"lines"];
	} else if ([key isEqualToString:@"scene"]) {
		[super setValue:[WTMScene instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"scene"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMCollectionOfColumn*)columns{
	if([_columns isAnAlias]){
		id o=[_registry objectWithUinstID:_columns.uinstID];
		if(o){
			_columns=o;
		}
	}
	return _columns;
}


- (WTMCollectionOfColumn*)columns_auto{
	_columns=[self columns];
	if(!_columns){
		_columns=[[WTMCollectionOfColumn alloc] initInRegistry:_registry];
	}
	return _columns;
}

- (void)setColumns:(WTMCollectionOfColumn*)columns{
	_columns=columns;
}

- (WTMCollectionOfLine*)lines{
	if([_lines isAnAlias]){
		id o=[_registry objectWithUinstID:_lines.uinstID];
		if(o){
			_lines=o;
		}
	}
	return _lines;
}


- (WTMCollectionOfLine*)lines_auto{
	_lines=[self lines];
	if(!_lines){
		_lines=[[WTMCollectionOfLine alloc] initInRegistry:_registry];
	}
	return _lines;
}

- (void)setLines:(WTMCollectionOfLine*)lines{
	_lines=lines;
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
	if(self.columns){
		if(includeChildren){
			[dictionary setValue:[self.columns dictionaryRepresentationWithChildren:includeChildren] forKey:@"columns"];
		}else{
			[dictionary setValue:[self.columns aliasDictionaryRepresentation] forKey:@"columns"];
		}
	}
	if(self.lines){
		if(includeChildren){
			[dictionary setValue:[self.lines dictionaryRepresentationWithChildren:includeChildren] forKey:@"lines"];
		}else{
			[dictionary setValue:[self.lines aliasDictionaryRepresentation] forKey:@"lines"];
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
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WTMTable ",self.uinstID];
	[s appendFormat:@"columns : %@\n",NSStringFromClass([self.columns class])];
	[s appendFormat:@"lines : %@\n",NSStringFromClass([self.lines class])];
	[s appendFormat:@"scene : %@\n",NSStringFromClass([self.scene class])];
	return s;
}

@end
