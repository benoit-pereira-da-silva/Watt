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
//  WTMLangDictionary.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMLangDictionary.h" 

@implementation WTMLangDictionary 

@synthesize key=_key;
@synthesize locale=_locale;
@synthesize value=_value;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"key"]){
		[super setValue:value forKey:@"key"];
	} else if ([key isEqualToString:@"locale"]) {
		[super setValue:value forKey:@"locale"];
	} else if ([key isEqualToString:@"value"]) {
		[super setValue:value forKey:@"value"];
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
	[dictionary setValue:self.key forKey:@"key"];
	[dictionary setValue:self.locale forKey:@"locale"];
	[dictionary setValue:self.value forKey:@"value"];
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"Instance of %@ :\n",NSStringFromClass([self class])];
	[s appendFormat:@"key : %@\n",self.key];
	[s appendFormat:@"locale : %@\n",self.locale];
	[s appendFormat:@"value : %@\n",self.value];
	return s;
}

@end
