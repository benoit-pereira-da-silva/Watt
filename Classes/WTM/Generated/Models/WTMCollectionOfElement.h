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
//  WTMCollectionOfElement.h
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMElement.h" 
#import "WattCollectionOfModel.h" 

@interface WTMCollectionOfElement:WattCollectionOfModel <WattCoding>{
}
- (void)enumerateObjectsUsingBlock:(void (^)(WTMElement *obj, NSUInteger idx, BOOL *stop))block reverse:(BOOL)useReverseEnumeration;
- ( WTMCollectionOfElement*)filteredCollectionUsingBlock:(BOOL (^)(WTMElement  *obj))block withRegistry:(WattRegistry *)registry;
- (WTMCollectionOfElement*)filteredCollectionUsingPredicate:(NSPredicate *)predicate withRegistry:(WattRegistry *)registry;
- (NSUInteger)count;
- (WTMElement *)objectAtIndex:(NSUInteger)index;
- (WTMElement *)firstObject;
- (WTMElement *)lastObject;
- (WTMElement *)firstObjectCommonWithArray:(NSArray*)array;
- (void)addObject:(WTMElement*)anObject;
- (void)insertObject:(WTMElement*)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMElement*)anObject;

@end