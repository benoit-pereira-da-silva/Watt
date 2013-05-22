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
//  WTMPackage.h
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WTMCollectionOfActivity.h" 

@implementation WTMCollectionOfActivity{
}

-(id)initInRegistry:(WattRegistry*)registry{
    self=[super initInRegistry:registry];
    if(self){
        _collection=[NSMutableArray array];
    }
    return self;
}

+ (WTMCollectionOfActivity*)instanceFromDictionary:(NSDictionary *)aDictionary inRegistry:(WattRegistry*)registry{
	WTMCollectionOfActivity*instance = nil;
	if([aDictionary objectForKey:__className__] && [aDictionary objectForKey:__properties__]){
		Class theClass=NSClassFromString([aDictionary objectForKey:__className__]);
		id unCasted= [[theClass alloc] initInRegistry:registry];
		[unCasted setAttributesFromDictionary:[aDictionary objectForKey:__properties__]];
		instance=(WTMCollectionOfActivity*)unCasted;
		[registry registerObject:instance];
	}
	return instance;
}


- (NSDictionary*)dictionaryRepresentation{
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableArray *array=[NSMutableArray array];
    for (WTMActivity *o in _collection) {
        NSDictionary*oDictionary=[o dictionaryRepresentation];
        [array addObject:oDictionary];
    }
    [dictionary setValue:array forKey:__collection__];
	[wrapper setObject:NSStringFromClass([self class]) forKey:__className__];
    [wrapper setObject:dictionary forKey:__properties__];
    [wrapper setObject:[NSNumber numberWithInteger:self.uinstID] forKey:__uinstID__];
    return wrapper;
}

- (WTMCollectionOfActivity*)localized{
	[self localize];
	return self;
}


-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
    [s appendFormat:@"Collection of %@\n",@"WTMActivity"];
    [s appendFormat:@"With of %i members\n",[_collection count]];
	return s;
}


- (NSUInteger)count{
    return [_collection count];
}
- (WTMActivity *)objectAtIndex:(NSUInteger)index{
	return [_collection objectAtIndex:index];
}

- (WTMActivity *)lastObject{
    return [_collection lastObject];
}

- (WTMActivity *)firstObjectCommonWithArray:(NSArray*)array{
    return [_collection firstObjectCommonWithArray:array];
}

- (void)addObject:(WTMActivity*)anObject{
 	[_collection addObject:anObject];
}

- (void)insertObject:(WTMActivity*)anObject atIndex:(NSUInteger)index{
	[_collection insertObject:anObject atIndex:index];
}

- (void)removeLastObject{
	[_collection removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [_collection removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMActivity*)anObject{
    [_collection replaceObjectAtIndex:index withObject:anObject];
}


@end
