//
//  SCStringUtil.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCStringUtil : NSObject

/**
 判断一个子串是否为电话号码
 */
+ (BOOL)isPhoneNumber:(NSString *)str;
/**
 判断是否符合密码设置规范
 */
+ (BOOL)isPassword:(NSString *)str;
/**
 判断是否是有效字符，即不包含特殊字符
 */
+ (BOOL)isValidCharact: (NSString *)str;
/**
 判断字符串是否为空
 */
+ (BOOL)isEmpty:(NSString *)str;
/**
 判断家庭名称是否符合要求
 */
+ (BOOL)isMatchFamilyName:(NSString *)str;
/**
 判断家庭的描述是否符合要求
 */
+ (BOOL)isMatchFamilyDesc:(NSString *)str;
/**
 判断用户昵称是否符合要求
 */
+ (BOOL)isMatchUserNick:(NSString *)str;
/**
 判断用户备注是否符合要求
 */
+ (BOOL)isMatchUserNote:(NSString *)str;
/**
 判断用户个性签名是否符合要求
 */
+ (BOOL)isMatchUserSign:(NSString *)str;
/**
 将string转为date
 */
+ (NSDate *)dateFromString:(NSString *)str;
/**
 将date转为string
 */
+ (NSString *)simpleStringFromDate:(NSDate *)date;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringFromCurrentDate;
/**
 将timestamp转为string
 */
+ (NSString *)simpleStringFromTimeStamp:(NSNumber *)timeStamp;
+ (NSString *)stringFromTimeStamp:(NSNumber *)timeStamp;
/**
 将输入的日期与今天的日期做比较
 */
+ (NSString *)compareDateToToday:(NSString *)dateString;
+ (NSNumber *)intervalDayFromToday:(NSString *)dateString;
/**
 将json的string转换为dic
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 获取APP的版本名称
 */+ (NSString *)getAppBundleVersionShort;
+ (NSString *)getAppBundleVersion;
+ (int)getCodeByName:(NSString *)versionName;
/**
 获取系统的版本号
 */
+ (NSString *)getSystemVersion;
+ (NSString *)getTimeNow;
+ (NSDictionary *)getUrlParams:(NSString *)url;

+ (NSString *)getRealString:(NSString *)string;

/**是否含有表情*/
+ (BOOL)stringContainsEmoji:(NSString *)string;

@end
