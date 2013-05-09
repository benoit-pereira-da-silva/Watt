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
//  WTMActivity.h
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WTMCollectionOfScene.h" 

@implementation WTMCollectionOfScene{
	NSMutableArray* _collection;
}

-(id)init{
    self=[super init];
    if(self){
        _collection=[NSMutableArray array];
    }
    return self;
}

+ (WTMCollectionOfScene*)instanceFromDictionary:(NSDictionary *)aDictionary{
	WTMCollectionOfScene*instance = nil;
	if([aDictionary objectForKey:@"className"] && [aDictionary objectForKey:@"properties"]){
		Class theClass=NSClassFromString([aDictionary objectForKey:@"className"]);
		id unCasted= [[theClass alloc] init];
		[unCasted setAttributesFromDictionary:[aDictionary objectForKey:@"properties"]];
		instance=(WTMCollectionOfScene*)unCasted;
	}
	return instance;
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
	if (![aDictionary isKindOfClass:[NSDictionary class]]) {
		return;
	}
	_collection=[NSMutableArray array];
    NSArray *a=[aDictionary objectForKey:@"collection"];
    for (NSDictionary*objectDictionary in a) {
        WTMScene*o=[WTMScene instanceFromDictionary:objectDictionary];
        [_collection addObject:o];
    }
}


- (NSDictionary*)dictionaryRepresentation{
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableArray *array=[NSMutableArray array];
    for (WTMScene *o in _collection) {
        NSDictionary*oDictionary=[o dictionaryRepresentation];
        [array addObject:oDictionary];
    }
    [dictionary setValue:array forKey:@"collection"];
	[wrapper setObject:NSStringFromClass([self class]) forKey:@"className"];
    [wrapper setObject:dictionary forKey:@"properties"];
    return wrapper;
}


-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
    [s appendFormat:@"Collection of %@\n",@"WTMScene"];
    [s appendFormat:@"With of %i members\n",[_collection count]];
	return s;
}


- (NSUInteger)count{
    return [_collection count];
}
- (WTMScene *)objectAtIndex:(NSUInteger)index{
	return [_collection objectAtIndex:index];
}


- (void)addObject:(WTMScene*)anObject{
 	[_collection addObject:anObject];
}

- (void)insertObject:(WTMScene*)anObject atIndex:(NSUInteger)index{
	[_collection insertObject:anObject atIndex:index];
}

- (void)removeLastObject{
	[_collection removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [_collection removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMScene*)anObject{
    [_collection replaceObjectAtIndex:index withObject:anObject];
}


@end
