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
//  WTMBehavior.m
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 
#import "WTMBehavior.h" 
#import "WTMAction.h"
#import "WTMRule.h"

@implementation WTMBehavior 

@synthesize comment=_comment;
@synthesize action=_action;
@synthesize trigger=_trigger;

- (void)setValue:(id)value forKey:(NSString *)key {
	if ([key isEqualToString:@"comment"]){
		[super setValue:value forKey:@"comment"];
	} else if ([key isEqualToString:@"action"]) {
		[super setValue:[WTMAction instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"action"];
	} else if ([key isEqualToString:@"trigger"]) {
		[super setValue:[WTMRule instanceFromDictionary:value inRegistry:_registry includeChildren:NO] forKey:@"trigger"];
	} else {
		[super setValue:value forKey:key];
	}
}

- (WTMAction*)action{
	if([_action isAnAlias]){
		id o=[_registry objectWithUinstID:_action.uinstID];
		if(o){
			_action=o;
		}
	}
	return _action;
}


- (WTMAction*)action_auto{
	_action=[self action];
	if(!_action){
		_action=[[WTMAction alloc] initInRegistry:_registry];
	}
	return _action;
}

- (void)setAction:(WTMAction*)action{
	_action=action;
}

- (WTMRule*)trigger{
	if([_trigger isAnAlias]){
		id o=[_registry objectWithUinstID:_trigger.uinstID];
		if(o){
			_trigger=o;
		}
	}
	return _trigger;
}


- (WTMRule*)trigger_auto{
	_trigger=[self trigger];
	if(!_trigger){
		_trigger=[[WTMRule alloc] initInRegistry:_registry];
	}
	return _trigger;
}

- (void)setTrigger:(WTMRule*)trigger{
	_trigger=trigger;
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
	[dictionary setValue:self.comment forKey:@"comment"];
	if(self.action){
		if(includeChildren){
			[dictionary setValue:[self.action dictionaryRepresentationWithChildren:includeChildren] forKey:@"action"];
		}else{
			[dictionary setValue:[self.action aliasDictionaryRepresentation] forKey:@"action"];
		}
	}
	if(self.trigger){
		if(includeChildren){
			[dictionary setValue:[self.trigger dictionaryRepresentationWithChildren:includeChildren] forKey:@"trigger"];
		}else{
			[dictionary setValue:[self.trigger aliasDictionaryRepresentation] forKey:@"trigger"];
		}
	}
    return dictionary;
}


- (NSString*)description{
    if([self isAnAlias])
        return [super aliasDescription];
    NSMutableString *s=[NSMutableString stringWithString:[super description]];
	[s appendFormat:@"Instance of %@ (%i) :\n",@"WTMBehavior ",self.uinstID];
	[s appendFormat:@"comment : %@\n",self.comment];
	[s appendFormat:@"action : %@\n",NSStringFromClass([self.action class])];
	[s appendFormat:@"trigger : %@\n",NSStringFromClass([self.trigger class])];
	return s;
}

@end