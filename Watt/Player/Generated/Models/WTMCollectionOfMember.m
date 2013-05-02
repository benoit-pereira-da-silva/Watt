// This file is part of "Watt-Multimedia-Engine"
// 
// "Watt-Multimedia-Engine" is free software: you can redistribute it and/or modify
// it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// "Watt-Multimedia-Engine" is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU LESSER GENERAL PUBLIC LICENSE for more details.
// 
// You should have received a copy of the GNU LESSER GENERAL PUBLIC LICENSE
// along with "Watt-Multimedia-Engine"  If not, see <http://www.gnu.org/licenses/>
// 
//  WTMLibrary.h
//  Watt-Multimedia-Engine
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WTMCollectionOfMember.h" 

@implementation WTMCollectionOfMember{
	NSMutableArray* _collection;
}

-(id)init{
    self=[super init];
    if(self){
        _collection=[NSMutableArray array];
    }
    return self;
}

+ (WTMCollectionOfMember*)instanceFromDictionary:(NSDictionary *)aDictionary{
	WTMCollectionOfMember* instance = [[WTMCollectionOfMember alloc] init];
	[instance setAttributesFromDictionary:aDictionary];
	return instance;
}


- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
	if (![aDictionary isKindOfClass:[NSDictionary class]]) {
		return;
	}
	_collection=[NSMutableArray array];
    NSArray *a=[aDictionary objectForKey:@"collection"];
    for (NSDictionary*objectDictionary in a) {
        WTMMember*o=[WTMMember instanceFromDictionary:objectDictionary];
        [_collection addObject:o];
    }
}


- (NSDictionary*)dictionaryRepresentation{
	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableArray *array=[NSMutableArray array];
    for (WTMMember *o in _collection) {
        NSDictionary*oDictionary=[o dictionaryRepresentation];
        [array addObject:oDictionary];
    }
    [dictionary setValue:array forKey:@"collection"];
	return dictionary;
}


-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
    [s appendFormat:@"Collection of %@\n",@"WTMMember"];
    [s appendFormat:@"With of %i members\n",[_collection count]];
	return s;
}


- (NSUInteger)count{
    return [_collection count];
}
- (WTMMember *)objectAtIndex:(NSUInteger)index{
	return [_collection objectAtIndex:index];
}


- (void)addObject:(WTMMember*)anObject{
 	[_collection addObject:anObject];
}

- (void)insertObject:(WTMMember*)anObject atIndex:(NSUInteger)index{
	[_collection insertObject:anObject atIndex:index];
}

- (void)removeLastObject{
	[_collection removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [_collection removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMMember*)anObject{
    [_collection replaceObjectAtIndex:index withObject:anObject];
}


@end
