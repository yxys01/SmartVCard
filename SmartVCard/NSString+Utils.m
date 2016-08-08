//
//  NSString+Utils.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/1.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

//汉字的拼音
- (NSString *)pinyin{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform(( CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
