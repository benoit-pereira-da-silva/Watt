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
//  WTMRule.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMRule.h" 
#import "WTMOperand.h"
#import "WTMOperand.h"
#import "WTMOperator.h"

@implementation WTMRule 

@synthesize name=_name;
@synthesize operandsA=_operandsA;
@synthesize operandsB=_operandsB;
@synthesize operator=_operator;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"name"]){
		[super setValue:value forKey:@"name"];
	} else if ([key isEqualToString:@"operandsA"]) {
		[super setValue:[WTMOperand instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"operandsA"];
	} else if ([key isEqualToString:@"operandsB"]) {
		[super setValue:[WTMOperand instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"operandsB"];
	} else if ([key isEqualToString:@"operator"]) {
		[super setValue:[WTMOperator instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"operator"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMOperand*)operandsA{
	if([_operandsA isAnAlias]){
		id o=[_registry objectWithUinstID:_operandsA.uinstID];
		if(o){
			_operandsA=o;
		}
	}
	return _operandsA;
}


- (WTMOperand*)operandsA_auto{
	_operandsA=[self operandsA];
	if(!_operandsA){
		_operandsA=[[WTMOperand alloc] initInRegistry:_registry];
	}
	return _operandsA;
}

- (void)setOperandsA:(WTMOperand*)operandsA{
	_operandsA=operandsA;
}

- (WTMOperand*)operandsB{
	if([_operandsB isAnAlias]){
		id o=[_registry objectWithUinstID:_operandsB.uinstID];
		if(o){
			_operandsB=o;
		}
	}
	return _operandsB;
}


- (WTMOperand*)operandsB_auto{
	_operandsB=[self operandsB];
	if(!_operandsB){
		_operandsB=[[WTMOperand alloc] initInRegistry:_registry];
	}
	return _operandsB;
}

- (void)setOperandsB:(WTMOperand*)operandsB{
	_operandsB=operandsB;
}

- (WTMOperator*)operator{
	if([_operator isAnAlias]){
		id o=[_registry objectWithUinstID:_operator.uinstID];
		if(o){
			_operator=o;
		}
	}
	return _operator;
}


- (WTMOperator*)operator_auto{
	_operator=[self operator];
	if(!_operator){
		_operator=[[WTMOperator alloc] initInRegistry:_registry];
	}
	return _operator;
}

- (void)setOperator:(WTMOperator*)operator{
	_operator=operator;
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
	[dictionary setValue:self.name forKey:@"name"];
	if(self.operandsA){
		if(includeChildren){
			[dictionary setValue:[self.operandsA dictionaryRepresentationWithChildren:includeChildren] forKey:@"operandsA"];
		}else{
			[dictionary setValue:[self.operandsA aliasDictionaryRepresentation] forKey:@"operandsA"];
		}
	}
	if(self.operandsB){
		if(includeChildren){
			[dictionary setValue:[self.operandsB dictionaryRepresentationWithChildren:includeChildren] forKey:@"operandsB"];
		}else{
			[dictionary setValue:[self.operandsB aliasDictionaryRepresentation] forKey:@"operandsB"];
		}
	}
	if(self.operator){
		if(includeChildren){
			[dictionary setValue:[self.operator dictionaryRepresentationWithChildren:includeChildren] forKey:@"operator"];
		}else{
			[dictionary setValue:[self.operator aliasDictionaryRepresentation] forKey:@"operator"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WTMRule ",self.uinstID];
	[s appendFormat:@"name : %@\n",self.name];
	[s appendFormat:@"operandsA : %@\n",NSStringFromClass([self.operandsA class])];
	[s appendFormat:@"operandsB : %@\n",NSStringFromClass([self.operandsB class])];
	[s appendFormat:@"operator : %@\n",NSStringFromClass([self.operator class])];
	return s;
}

@end