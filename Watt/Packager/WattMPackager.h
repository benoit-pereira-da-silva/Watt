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
//  WTMPackager.h
//
//  Created by Benoit Pereira da Silva on 17/05/13.
//  Copyright (c) 2013 Pereira da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SSZipArchive.h"

#if TARGET_OS_IPHONE
#import "SVProgressHUD.h"
#endif


@interface WattMPackager : NSObject


// WTMPackager singleton accessor
+ (WattMPackager*)sharedInstance;

#pragma mark - ZIP / UNZIP

-(void)unZip:(NSString*)zipSourcePath
          to:(NSString*)destinationFolder
   withBlock:(void (^)(BOOL success))block;

-(void)zip:(NSString*)sourcePath
        to:(NSString*)destinationZipFilePath
 withBlock:(void (^)(BOOL success))block;



@end