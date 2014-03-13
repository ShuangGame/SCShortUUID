//
//  SCShortUUID.h
//  SCShortUUID
//
//  Created by Shuang on 14-3-13.
//  Copyright (c) 2014年 Shuang. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED <__IPHONE_6_0
#error Deployment Target 6.0 required for [NSUUID UUID]
#endif

@interface SCShortUUID : NSObject
+(NSString*)UUIDString;
@end
