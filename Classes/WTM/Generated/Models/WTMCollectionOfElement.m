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
//  WTMScene.h
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WTMCollectionOfElement.h" 

@implementation WTMCollectionOfElement{
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
	[s appendFormat:@"Instance of %@ (%@) :\n",NSStringFromClass([self class]),@(self.uinstID)];
    [s appendFormat:@"Collection of %@\n",@"WTMElement"];
    [s appendFormat:@"With of %@ members\n",@([_collection count])];
	return s;
}

- (void)enumerateObjectsUsingBlock:(void (^)(WTMElement *obj, NSUInteger idx, BOOL *stop))block reverse:(BOOL)useReverseEnumeration{
	 NSUInteger idx = 0;
    BOOL stop = NO;
    NSEnumerator * enumerator=useReverseEnumeration?[_collection reverseObjectEnumerator]: [_collection objectEnumerator];
    for( WTMElement* obj in enumerator ){
        block(obj, idx++, &stop);
        if( stop )
            break;
    }
}

- ( WTMCollectionOfElement*)filteredCollectionUsingBlock:(BOOL (^)(WTMElement  *obj))block withRegistry:(WattRegistry *)registry{
	 WTMCollectionOfElement *__block collection=[[WTMCollectionOfElement alloc] initInRegistry:registry];
	    [self enumerateObjectsUsingBlock:^(WTMElement *obj, NSUInteger idx, BOOL *stop) {
	        if(block(obj)){
	            [collection addObject:obj];
	        }
	    } reverse:NO];
	    return collection;
	}

- (WTMCollectionOfElement*)filteredCollectionUsingPredicate:(NSPredicate *)predicate withRegistry:(WattRegistry *)registry{
	return (WTMCollectionOfElement*)[super filteredCollectionUsingPredicate:predicate withRegistry:registry];
}

- (NSUInteger)count{
    return [_collection count];
}
- (WTMElement *)objectAtIndex:(NSUInteger)index{
	return (WTMElement*)[super  objectAtIndex:index];
}

- (WTMElement *)lastObject{
    return  (WTMElement*)[super lastObject];
}

- (WTMElement *)firstObject{
    return  (WTMElement*)[super firstObject];
}

- (WTMElement *)firstObjectCommonWithArray:(NSArray*)array{
    return (WTMElement*)[super firstObjectCommonWithArray:array];
}

- (void)addObject:(WTMElement*)anObject{
 	[super addObject:anObject];
}

- (void)insertObject:(WTMElement*)anObject atIndex:(NSUInteger)index{
	[super insertObject:anObject atIndex:index];
}

- (void)removeLastObject{
	[super removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [super removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMElement*)anObject{
    [super replaceObjectAtIndex:index withObject:anObject];
}

- (Class)collectedObjectClass{
	return [WTMElement class];
}

@end
