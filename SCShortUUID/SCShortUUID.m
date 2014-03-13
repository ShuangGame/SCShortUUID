//
//  SCShortUUID.m
//  SCShortUUID
//
//  Created by Shuang on 14-3-13.
//  Copyright (c) 2014年 Shuang. All rights reserved.
//

#import "SCShortUUID.h"


#if __IPHONE_OS_VERSION_MIN_REQUIRED <__IPHONE_6_0
#error Deployment Target 6.0 required for [NSUUID UUID]
#endif

@implementation SCShortUUID
+(NSString*)UUIDString{
    NSUUID *sysUUID=[NSUUID UUID];
    uuid_t uuid;
    [sysUUID getUUIDBytes:uuid];
    NSData *uuidData = [NSData dataWithBytes:uuid length:16];
    NSString *string32=[self base32EncodingWithData:uuidData];
    return string32;
}

/*
 UUIDを少し短くするUUIDShortener
 http://d.hatena.ne.jp/KishikawaKatsumi/20131031/1383235295
 */
+ (NSString *)base32EncodingWithData:(NSData *)data
{
    NSUInteger length = data.length;
    const unsigned char *dataBuffer = data.bytes;
    
    if (length == 0 || !dataBuffer) {
        return nil;
    }
    
    int bufSize = 256;
    char result[bufSize];
    
    NSUInteger count = 0;
    unsigned long buffer = dataBuffer[0];
    int next = 1;
    int bitsLeft = 8;
    while (count < bufSize && (bitsLeft > 0 || next < length)) {
        if (bitsLeft < 5) {
            if (next < length) {
                buffer <<= 8;
                buffer |= dataBuffer[next++] & 0xFF;
                bitsLeft += 8;
            } else {
                int pad = 5 - bitsLeft;
                buffer <<= pad;
                bitsLeft += pad;
            }
        }
        int index = 0x1F & (buffer >> (bitsLeft - 5));
        bitsLeft -= 5;
        result[count++] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"[index];
    }
    if (count < bufSize) {
        result[count] = '\000';
    }
    
    return [NSString stringWithUTF8String:result];
}
@end
