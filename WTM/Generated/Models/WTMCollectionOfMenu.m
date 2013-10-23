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
//  WTMMenu.h
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WTMCollectionOfMenu.h" 

@implementation WTMCollectionOfMenu{
}

- (instancetype)initInRegistry:(WattRegistry*)registry{
    self=[super initInRegistry:registry];
    if(self){
        _collection=[NSMutableArray array];
    }
    return self;
}
  

#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)registry{
    WTMCollectionOfMenu *instance=[self copy];
    [registry addObject:instance];
     WattRegistry *__block registryReference=registry;
    [self enumerateObjectsUsingBlock:^(WTMMenu *obj, NSUInteger idx, BOOL *stop) {
        [registryReference addObject:obj]; 
    } reverse:NO];
    return instance;
}


// NSCopying
- (id)copyWithZone:(NSZone *)zone{
    WTMCollectionOfMenu*instance=[super copyWithZone:zone];
    instance->_registry=nil; // We want to furnish a registry free copy
    //_uinstID=0;// we do not provide an _uinstID
   WTMCollectionOfMenu*__block ref=instance;
    [self enumerateObjectsUsingBlock:^(WTMMenu *obj, NSUInteger idx, BOOL *stop) {
        [ref addObject:[obj copy]];
    } reverse:NO];
    return instance;
}


#pragma mark -



- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ (%i) :\n",NSStringFromClass([self class]),self.uinstID];
    [s appendFormat:@"Collection of %@\n",@"WTMMenu"];
    [s appendFormat:@"With of %i members\n",[_collection count]];
	return s;
}

- (void)enumerateObjectsUsingBlock:(void (^)(WTMMenu *obj, NSUInteger idx, BOOL *stop))block reverse:(BOOL)useReverseEnumeration{
	 NSUInteger idx = 0;
    BOOL stop = NO;
    NSEnumerator * enumerator=useReverseEnumeration?[_collection reverseObjectEnumerator]: [_collection objectEnumerator];
    for( WTMMenu* obj in enumerator ){
        block(obj, idx++, &stop);
        if( stop )
            break;
    }
}

- ( WTMCollectionOfMenu*)filteredCollectionUsingBlock:(BOOL (^)(WTMMenu  *obj))block withRegistry:(WattRegistry *)registry{
	 WTMCollectionOfMenu *__block collection=[[WTMCollectionOfMenu alloc] initInRegistry:registry];
	    [self enumerateObjectsUsingBlock:^(WTMMenu *obj, NSUInteger idx, BOOL *stop) {
	        if(block(obj)){
	            [collection addObject:obj];
	        }
	    } reverse:NO];
	    return collection;
	}

- (WTMCollectionOfMenu*)filteredCollectionUsingPredicate:(NSPredicate *)predicate withRegistry:(WattRegistry *)registry{
	return (WTMCollectionOfMenu*)[super filteredCollectionUsingPredicate:predicate withRegistry:registry];
}

- (NSUInteger)count{
    return [_collection count];
}
- (WTMMenu *)objectAtIndex:(NSUInteger)index{
	return (WTMMenu*)[super  objectAtIndex:index];
}

- (WTMMenu *)lastObject{
    return  (WTMMenu*)[super lastObject];
}

- (WTMMenu *)firstObject{
    return  (WTMMenu*)[super firstObject];
}

- (WTMMenu *)firstObjectCommonWithArray:(NSArray*)array{
    return (WTMMenu*)[super firstObjectCommonWithArray:array];
}

- (void)addObject:(WTMMenu*)anObject{
 	[super addObject:anObject];
}

- (void)insertObject:(WTMMenu*)anObject atIndex:(NSUInteger)index{
	[super insertObject:anObject atIndex:index];
}

- (void)removeLastObject{
	[super removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [super removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMMenu*)anObject{
    [super replaceObjectAtIndex:index withObject:anObject];
}


@end
