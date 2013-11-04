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
//  WTMHyperlink.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMHyperlink.h" 

@implementation WTMHyperlink 

@synthesize allowExploration=_allowExploration;
@synthesize updateImageOnChange=_updateImageOnChange;
@synthesize updateUrlOnChange=_updateUrlOnChange;
@synthesize urlString=_urlString;


#pragma  mark WattCopying

- (instancetype)wattCopyInRegistry:(WattRegistry*)destinationRegistry{
	WTMHyperlink *instance=[super wattCopyInRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_allowExploration=_allowExploration;
	instance->_updateImageOnChange=_updateImageOnChange;
	instance->_updateUrlOnChange=_updateUrlOnChange;
	instance->_urlString=[_urlString copy];
    return instance;
}

#pragma  mark WattExtraction

- (instancetype)wattExtractAndCopyToRegistry:(WattRegistry*)destinationRegistry{
	WTMHyperlink *instance=[super wattExtractAndCopyToRegistry:destinationRegistry];
	instance->_registry=destinationRegistry;
	instance->_allowExploration=_allowExploration;
	instance->_updateImageOnChange=_updateImageOnChange;
	instance->_updateUrlOnChange=_updateUrlOnChange;
	instance->_urlString=[_urlString copy];
    return instance;
}




#pragma mark -


- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"a"]){
		[super setValue:value forKey:@"a"];
	} else if ([key isEqualToString:@"b"]) {
		[super setValue:value forKey:@"b"];
	} else if ([key isEqualToString:@"c"]) {
		[super setValue:value forKey:@"c"];
	} else if ([key isEqualToString:@"d"]) {
		[super setValue:value forKey:@"d"];
	} else {
		[super setValue:value forKey:key];
	}
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
	[dictionary setValue:@(self.allowExploration) forKey:@"a"];
	[dictionary setValue:@(self.updateImageOnChange) forKey:@"b"];
	[dictionary setValue:@(self.updateUrlOnChange) forKey:@"c"];
	if(self.urlString){
		[dictionary setValue:self.urlString forKey:@"d"];
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WTMHyperlink ",self.uinstID];
	[s appendFormat:@"allowExploration : %@\n",@(self.allowExploration)];
	[s appendFormat:@"updateImageOnChange : %@\n",@(self.updateImageOnChange)];
	[s appendFormat:@"updateUrlOnChange : %@\n",@(self.updateUrlOnChange)];
	[s appendFormat:@"urlString : %@\n",self.urlString];
	return s;
}

@end
