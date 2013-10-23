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
//  WTMShelf.h
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WTMCollectionOfMenuSection.h" 

@implementation WTMCollectionOfMenuSection{
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
    WTMCollectionOfMenuSection *instance=[self copy];
    [registry addObject:instance];
     WattRegistry *__block registryReference=registry;
    [self enumerateObjectsUsingBlock:^(WTMMenuSection *obj, NSUInteger idx, BOOL *stop) {
        [registryReference addObject:obj]; 
    } reverse:NO];
    return instance;
}


// NSCopying
- (id)copyWithZone:(NSZone *)zone{
    WTMCollectionOfMenuSection*instance=[super copyWithZone:zone];
    instance->_registry=nil; // We want to furnish a registry free copy
    //_uinstID=0;// we do not provide an _uinstID
   WTMCollectionOfMenuSection*__block ref=instance;
    [self enumerateObjectsUsingBlock:^(WTMMenuSection *obj, NSUInteger idx, BOOL *stop) {
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
    [s appendFormat:@"Collection of %@\n",@"WTMMenuSection"];
    [s appendFormat:@"With of %i members\n",[_collection count]];
	return s;
}

- (void)enumerateObjectsUsingBlock:(void (^)(WTMMenuSection *obj, NSUInteger idx, BOOL *stop))block reverse:(BOOL)useReverseEnumeration{
	 NSUInteger idx = 0;
    BOOL stop = NO;
    NSEnumerator * enumerator=useReverseEnumeration?[_collection reverseObjectEnumerator]: [_collection objectEnumerator];
    for( WTMMenuSection* obj in enumerator ){
        block(obj, idx++, &stop);
        if( stop )
            break;
    }
}

- ( WTMCollectionOfMenuSection*)filteredCollectionUsingBlock:(BOOL (^)(WTMMenuSection  *obj))block withRegistry:(WattRegistry *)registry{
	 WTMCollectionOfMenuSection *__block collection=[[WTMCollectionOfMenuSection alloc] initInRegistry:registry];
	    [self enumerateObjectsUsingBlock:^(WTMMenuSection *obj, NSUInteger idx, BOOL *stop) {
	        if(block(obj)){
	            [collection addObject:obj];
	        }
	    } reverse:NO];
	    return collection;
	}

- (WTMCollectionOfMenuSection*)filteredCollectionUsingPredicate:(NSPredicate *)predicate withRegistry:(WattRegistry *)registry{
	return (WTMCollectionOfMenuSection*)[super filteredCollectionUsingPredicate:predicate withRegistry:registry];
}

- (NSUInteger)count{
    return [_collection count];
}
- (WTMMenuSection *)objectAtIndex:(NSUInteger)index{
	return (WTMMenuSection*)[super  objectAtIndex:index];
}

- (WTMMenuSection *)lastObject{
    return  (WTMMenuSection*)[super lastObject];
}

- (WTMMenuSection *)firstObject{
    return  (WTMMenuSection*)[super firstObject];
}

- (WTMMenuSection *)firstObjectCommonWithArray:(NSArray*)array{
    return (WTMMenuSection*)[super firstObjectCommonWithArray:array];
}

- (void)addObject:(WTMMenuSection*)anObject{
 	[super addObject:anObject];
}

- (void)insertObject:(WTMMenuSection*)anObject atIndex:(NSUInteger)index{
	[super insertObject:anObject atIndex:index];
}

- (void)removeLastObject{
	[super removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [super removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(WTMMenuSection*)anObject{
    [super replaceObjectAtIndex:index withObject:anObject];
}


@end
