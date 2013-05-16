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
//  WTMHyperlink.m
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMHyperlink.h" 

@implementation WTMHyperlink 


-(id)init{
    self=[super init];
    if(self){
   
    }
    return self;
}


+ (WTMHyperlink*)instanceFromDictionary:(NSDictionary *)aDictionary{
	WTMHyperlink*instance = nil;
	// WTLog(@"%@",aDictionary);
	if([aDictionary objectForKey:@"className"] && [aDictionary objectForKey:@"properties"]){
		Class theClass=NSClassFromString([aDictionary objectForKey:@"className"]);
		id unCasted= [[theClass alloc] init];
		[unCasted setAttributesFromDictionary:aDictionary];
		instance=(WTMHyperlink*)unCasted;
	}
	return instance;
}


- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
	if (![aDictionary isKindOfClass:[NSDictionary class]]) {
		return;
	}
    if([aDictionary objectForKey:@"className"] && [aDictionary objectForKey:@"properties"]){
        id properties=[aDictionary objectForKey:@"properties"];
        NSString *selfClassName=NSStringFromClass([self class]);
        if (![selfClassName isEqualToString:[aDictionary objectForKey:@"className"]]) {
             [NSException raise:@"WTMAttributesException" format:@"selfClassName %@ is not a %@ ",selfClassName,[aDictionary objectForKey:@"className"]];
        }
        if([properties isKindOfClass:[NSDictionary class]]){
            for (NSString *key in properties) {
                id value=[properties objectForKey:key];
                if(value)
                    [self setValue:value forKey:key];
            }
        }else{
            [NSException raise:@"WTMAttributesException" format:@"properties is not a NSDictionary"];
        }
    }else{
        [self setValuesForKeysWithDictionary:aDictionary];
    }
}




- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"urlString"]){
		[super setValue:value forKey:@"urlString"];
	} else {
		[super setValue:value forKey:key];
	}
}

/*
// @todo implement the default values? 
- (void)setNilValueForKey:(NSString *)theKey{
    if ([theKey isEqualToString:@"age"]) {
        [self setValue:[NSNumber numberWithFloat:0.0] forKey:@"age"];
    } else
        [super setNilValueForKey:theKey];
}

//@todo implement the validation process
-(BOOL)validateName:(id *)ioValue error:(NSError * __autoreleasing *)outError{
 
    // The name must not be nil, and must be at least two characters long.
    if ((*ioValue == nil) || ([(NSString *)*ioValue length] < 2)) {
        if (outError != NULL) {
            NSString *errorString = NSLocalizedString(
                    @"A Person's name must be at least two characters long",
                    @"validation: Person, too short name error");
            NSDictionary *userInfoDict = @{ NSLocalizedDescriptionKey : errorString };
            *outError = [[NSError alloc] initWithDomain:@"PERSON_ERROR_DOMAIN"
                                                    code:1//PERSON_INVALID_NAME_CODE
                                                userInfo:userInfoDict];
        }
        return NO;
    }
    return YES;
}
*/


- (NSDictionary*)dictionaryRepresentation{
	NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];
	[dictionary setValue:self.urlString forKey:@"urlString"];
	[wrapper setObject:NSStringFromClass([self class]) forKey:@"className"];
    [wrapper setObject:dictionary forKey:@"properties"];
    return wrapper;
}

-(NSString*)description{
	NSMutableString *s=[NSMutableString string];
	[s appendFormat:@"urlString : %@\n",self.urlString];
	return s;
}

@end
