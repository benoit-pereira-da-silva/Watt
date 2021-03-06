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
//  WTMCell.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMCell.h" 
#import "WTMColumn.h"
#import "WTMElement.h"
#import "WTMLine.h"

@implementation WTMCell 

@synthesize attributes=_attributes;
@synthesize column=_column;
@synthesize element=_element;
@synthesize line=_line;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"attributes"]){
		[super setValue:value forKey:@"attributes"];
	} else if ([key isEqualToString:@"column"]) {
		[super setValue:[WTMColumn instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"column"];
	} else if ([key isEqualToString:@"element"]) {
		[super setValue:[WTMElement instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"element"];
	} else if ([key isEqualToString:@"line"]) {
		[super setValue:[WTMLine instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"line"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMColumn*)column{
	if([_column isAnAlias]){
		id o=[_registry objectWithUinstID:_column.uinstID];
		if(o){
			_column=o;
		}
	}
	return _column;
}


- (WTMColumn*)column_auto{
	_column=[self column];
	if(!_column){
		_column=[[WTMColumn alloc] initInRegistry:_registry];
	}
	return _column;
}

- (void)setColumn:(WTMColumn*)column{
	_column=column;
}

- (WTMElement*)element{
	if([_element isAnAlias]){
		id o=[_registry objectWithUinstID:_element.uinstID];
		if(o){
			_element=o;
		}
	}
	return _element;
}


- (WTMElement*)element_auto{
	_element=[self element];
	if(!_element){
		_element=[[WTMElement alloc] initInRegistry:_registry];
	}
	return _element;
}

- (void)setElement:(WTMElement*)element{
	_element=element;
}

- (WTMLine*)line{
	if([_line isAnAlias]){
		id o=[_registry objectWithUinstID:_line.uinstID];
		if(o){
			_line=o;
		}
	}
	return _line;
}


- (WTMLine*)line_auto{
	_line=[self line];
	if(!_line){
		_line=[[WTMLine alloc] initInRegistry:_registry];
	}
	return _line;
}

- (void)setLine:(WTMLine*)line{
	_line=line;
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
	if(_attributes){
		[dictionary setValue:self.attributes forKey:@"attributes"];
	}
	if(_column){
		if(includeChildren){
			[dictionary setValue:[self.column dictionaryRepresentationWithChildren:includeChildren] forKey:@"column"];
		}else{
			[dictionary setValue:[self.column aliasDictionaryRepresentation] forKey:@"column"];
		}
	}
	if(_element){
		if(includeChildren){
			[dictionary setValue:[self.element dictionaryRepresentationWithChildren:includeChildren] forKey:@"element"];
		}else{
			[dictionary setValue:[self.element aliasDictionaryRepresentation] forKey:@"element"];
		}
	}
	if(_line){
		if(includeChildren){
			[dictionary setValue:[self.line dictionaryRepresentationWithChildren:includeChildren] forKey:@"line"];
		}else{
			[dictionary setValue:[self.line aliasDictionaryRepresentation] forKey:@"line"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%@.%@) :\n",@"WTMCell ",_registry.uidString,@(_uinstID)];
	[s appendFormat:@"attributes : %@\n",self.attributes];
	[s appendFormat:@"column : %@\n",NSStringFromClass([self.column class])];
	[s appendFormat:@"element : %@\n",NSStringFromClass([self.element class])];
	[s appendFormat:@"line : %@\n",NSStringFromClass([self.line class])];
	return s;
}

@end
