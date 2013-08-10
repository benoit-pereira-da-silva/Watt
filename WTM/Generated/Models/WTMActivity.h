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
//  WTMActivity.h
//  WTM
//
//  Generated by Flexions  
//  Copyright (c) 2013 Benoit Pereira da Silva All rights reserved.
 

#import "WattModel.h"
#import "WattModel.h"
@class WTMPackage;
@class WTMImage;
@class WTMCollectionOfScene;

@interface WTMActivity:WattModel<WattCoding>{
}

@property (nonatomic,copy) NSString * controllerClass;
@property (nonatomic,assign) NSInteger  level;
@property (nonatomic,copy) NSString * nature;
@property (nonatomic,assign) NSInteger  rating;
@property (nonatomic,copy) NSString * shortName;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,strong) WTMPackage * package;
@property (nonatomic,strong) WTMImage * picture;
@property (nonatomic,strong) WTMCollectionOfScene * scenes;

- (WTMPackage*)package_auto;
- (WTMImage*)picture_auto;
- (WTMCollectionOfScene*)scenes_auto;

@end
