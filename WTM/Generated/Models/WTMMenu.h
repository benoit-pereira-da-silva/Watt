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
 

#import "WattModel.h"
@class WTMCollectionOfMenu;
@class WTMMenuSection;
@class WTMMenu;
@class WTMImage;

@interface WTMMenu:WattModel<WattCoding,WattCopying,WattExtraction>{
}

@property (nonatomic,copy) NSString * details;
@property (nonatomic,assign) NSInteger  index;
@property (nonatomic,copy) NSString * label;
@property (nonatomic,assign) NSInteger  referenceUinstID;
@property (nonatomic,copy) NSString * urlString;
@property (nonatomic,strong) WTMCollectionOfMenu * childrens;
@property (nonatomic,strong) WTMMenuSection * menuSection;// non extractible
@property (nonatomic,strong) WTMMenu * parent;
@property (nonatomic,strong) WTMImage * picture;

- (WTMCollectionOfMenu*)childrens_auto;
- (WTMMenuSection*)menuSection_auto;
- (WTMMenu*)parent_auto;
- (WTMImage*)picture_auto;

@end
