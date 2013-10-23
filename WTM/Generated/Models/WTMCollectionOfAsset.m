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
//  WTMAsset.h
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WTMCollectionOfAsset.h" 

@implementation WTMCollectionOfAsset{
}

- (instancetype)initInRegistry:(WattRegistry*)registry{
    self=[super initInRegistry:registry];
    if(self){
        _collection=[NSMutableArray array];
    }
    return self;
}

- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ (%i) :\n",NSStringFromClass([self class]),self.uinstID];
    [s appendFormat:@"Collection of %@\n",@"WTMAsset"];
    [s appendFormat:@"With of %i members\n",[_collection count]];
	return s;
}

- (void)enumerateObjectsUsingBlock:(void (^)(WTMAsset *obj, NSUInteger idx, BOOL *stop))block reverse:(BOOL)useReverseEnumeration{
	 NSUInteger idx = 0;
    BOOL stop = NO;
    NSEnumerator * enumerator=useReverseEnumeration?[_collection reverseObjectEnumerator]: [_collection objectEnumerator];
    for( WTMAsset* obj in enumerator ){
        block(obj, idx++, &stop);
        if( stop )
            break;
    }
}

- ( WTMCollectionOfAsset*)filteredCollectionUsingBlock:(BOOL (^)(WTMAsset  *obj))block withRegistry:(WattRegistry *)registry{
	 WTMCollectionOfAsset *__block collection=[[WTMCollectionOfAsset alloc] initInRegistry:registry];
	    [self enumerateObjectsUsingBlock:^(WTMAsset *obj, NSUInteger idx, BOOL *stop) {
	        if(block(obj)){
	            [collection addObject:obj];
	        }
	    } reverse:NO];
	    return collection;
	}

- (WTMCollectionOfAsset*)filteredCollectionUsingPredicate:(NSPredicate *)predicate withRegistry:(WattRegistry *)registry{
	return (WTMCollectionOfAsset*)[super filteredCollectionUsingPredicate:predicate withRegistry:registry];
}

- (NSUInteger)count{
    return [_collection count];
}
- (WTMAsset *)objectAtIndex:(NSUInteger)index{
	return (WTMAsset*)[super  objectAtIndex:index];
}

- (WTMAsset *)lastObject{
    return  (WTMAsset*)[super lastObject];
}

- (WTMAsset *)firstObject{
    return  (WTMAsset*)[super firstObject];
}

- (WTMAsset *)firstObjectCommonWithArray:(NSArray*)array{
    return (WTMAsset*)[super firstObjectCommonWithArray:array];
}

- (void)addObject:(WTMAsset*)anObject{
 	[super addObject:anObject];
}

- (void)insertObject:(WTMAsset*)anObject atIndex:(NSUInteger)index{
	[super insertObject:anObject atIndex:index];
}

- (void)removeLastObject{
	[super removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [super removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMAsset*)anObject{
    [super replaceObjectAtIndex:index withObject:anObject];
}


@end
