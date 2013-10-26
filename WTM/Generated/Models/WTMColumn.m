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
//  WTMColumn.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMColumn.h" 
#import "WTMCollectionOfBehavior.h"
#import "WTMCollectionOfCell.h"
#import "WTMTable.h"

@implementation WTMColumn 

@synthesize height=_height;
@synthesize behaviors=_behaviors;
@synthesize cells=_cells;
@synthesize table=_table;


#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry{
	WTMColumn *instance=[super wattCopyInRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_height=_height;
	instance->_behaviors=[_behaviors instancebyCopyTo:destinationRegistry];
	instance->_cells=[_cells instancebyCopyTo:destinationRegistry];
	instance->_table=[_table instancebyCopyTo:destinationRegistry];
    return instance;
}

#pragma  mark WattExtraction

- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry{
	WTMColumn *instance=[super wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_height=_height;
	instance->_behaviors=[_behaviors wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_cells=[_cells wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_table=[_table wattExtractAndCopyToRegistry:destinationRegistry];
    return instance;
}




#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"height"]){
		[super setValue:value forKey:@"height"];
	} else if ([key isEqualToString:@"behaviors"]) {
		[super setValue:[WTMCollectionOfBehavior instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"behaviors"];
	} else if ([key isEqualToString:@"cells"]) {
		[super setValue:[WTMCollectionOfCell instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"cells"];
	} else if ([key isEqualToString:@"table"]) {
		[super setValue:[WTMTable instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"table"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMCollectionOfBehavior*)behaviors{
	if([_behaviors isAnAlias]){
		id o=[_registry objectWithUinstID:_behaviors.uinstID];
		if(o){
			_behaviors=o;
		}
	}
	return _behaviors;
}


- (WTMCollectionOfBehavior*)behaviors_auto{
	_behaviors=[self behaviors];
	if(!_behaviors){
		_behaviors=[[WTMCollectionOfBehavior alloc] initInRegistry:_registry];
	}
	return _behaviors;
}

- (void)setBehaviors:(WTMCollectionOfBehavior*)behaviors{
	_behaviors=behaviors;
}

- (WTMCollectionOfCell*)cells{
	if([_cells isAnAlias]){
		id o=[_registry objectWithUinstID:_cells.uinstID];
		if(o){
			_cells=o;
		}
	}
	return _cells;
}


- (WTMCollectionOfCell*)cells_auto{
	_cells=[self cells];
	if(!_cells){
		_cells=[[WTMCollectionOfCell alloc] initInRegistry:_registry];
	}
	return _cells;
}

- (void)setCells:(WTMCollectionOfCell*)cells{
	_cells=cells;
}

- (WTMTable*)table{
	if([_table isAnAlias]){
		id o=[_registry objectWithUinstID:_table.uinstID];
		if(o){
			_table=o;
		}
	}
	return _table;
}


- (WTMTable*)table_auto{
	_table=[self table];
	if(!_table){
		_table=[[WTMTable alloc] initInRegistry:_registry];
	}
	return _table;
}

- (void)setTable:(WTMTable*)table{
	_table=table;
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
	[dictionary setValue:[NSNumber numberWithInteger:self.height] forKey:@"height"];
	if(self.behaviors){
		if(includeChildren){
			[dictionary setValue:[self.behaviors dictionaryRepresentationWithChildren:includeChildren] forKey:@"behaviors"];
		}else{
			[dictionary setValue:[self.behaviors aliasDictionaryRepresentation] forKey:@"behaviors"];
		}
	}
	if(self.cells){
		if(includeChildren){
			[dictionary setValue:[self.cells dictionaryRepresentationWithChildren:includeChildren] forKey:@"cells"];
		}else{
			[dictionary setValue:[self.cells aliasDictionaryRepresentation] forKey:@"cells"];
		}
	}
	if(self.table){
		if(includeChildren){
			[dictionary setValue:[self.table dictionaryRepresentationWithChildren:includeChildren] forKey:@"table"];
		}else{
			[dictionary setValue:[self.table aliasDictionaryRepresentation] forKey:@"table"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WTMColumn ",self.uinstID];
	[s appendFormat:@"height : %@\n",[NSNumber numberWithInteger:self.height]];
	[s appendFormat:@"behaviors : %@\n",NSStringFromClass([self.behaviors class])];
	[s appendFormat:@"cells : %@\n",NSStringFromClass([self.cells class])];
	[s appendFormat:@"table : %@\n",NSStringFromClass([self.table class])];
	return s;
}

@end
