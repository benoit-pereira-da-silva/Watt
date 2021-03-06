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
//  WTMMember.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMMember.h" 
#import "WTMLibrary.h"

@implementation WTMMember 

@synthesize name=_name;
@synthesize refererCounter=_refererCounter;
@synthesize thumbnailRelativePath=_thumbnailRelativePath;
@synthesize library=_library;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"name"]){
		[super setValue:value forKey:@"name"];
	} else if ([key isEqualToString:@"refererCounter"]) {
		[super setValue:value forKey:@"refererCounter"];
	} else if ([key isEqualToString:@"thumbnailRelativePath"]) {
		[super setValue:value forKey:@"thumbnailRelativePath"];
	} else if ([key isEqualToString:@"library"]) {
		[super setValue:[WTMLibrary instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"library"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMLibrary*)library{
	if([_library isAnAlias]){
		id o=[_registry objectWithUinstID:_library.uinstID];
		if(o){
			_library=o;
		}
	}
	return _library;
}


- (WTMLibrary*)library_auto{
	_library=[self library];
	if(!_library){
		_library=[[WTMLibrary alloc] initInRegistry:_registry];
	}
	return _library;
}

- (void)setLibrary:(WTMLibrary*)library{
	_library=library;
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
	if(_name){
		[dictionary setValue:self.name forKey:@"name"];
	}
	[dictionary setValue:@(self.refererCounter) forKey:@"refererCounter"];
	if(_thumbnailRelativePath){
		[dictionary setValue:self.thumbnailRelativePath forKey:@"thumbnailRelativePath"];
	}
	if(_library){
		if(includeChildren){
			[dictionary setValue:[self.library dictionaryRepresentationWithChildren:includeChildren] forKey:@"library"];
		}else{
			[dictionary setValue:[self.library aliasDictionaryRepresentation] forKey:@"library"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%@.%@) :\n",@"WTMMember ",_registry.uidString,@(_uinstID)];
	[s appendFormat:@"name : %@\n",self.name];
	[s appendFormat:@"refererCounter : %@\n",@(self.refererCounter)];
	[s appendFormat:@"thumbnailRelativePath : %@\n",self.thumbnailRelativePath];
	[s appendFormat:@"library : %@\n",NSStringFromClass([self.library class])];
	return s;
}

@end
