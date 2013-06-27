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
//  WTMMenuSection.h
//  Watt
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WattObject.h"
@class WTMCollectionOfMenu;

@interface WTMMenuSection:WattObject<WattCoding>{
}

@property (nonatomic,copy) NSString * details;
@property (nonatomic,strong) NSDictionary * extras;
@property (nonatomic,copy) NSString * imageFileName;
@property (nonatomic,assign) NSInteger  index;
@property (nonatomic,copy) NSString * label;
@property (nonatomic,strong) WTMCollectionOfMenu * menus;

- (WTMCollectionOfMenu*)menus_auto;

@end
