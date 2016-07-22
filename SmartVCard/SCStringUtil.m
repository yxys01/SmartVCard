//
//  SCStringUtil.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCStringUtil.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
@implementation SCStringUtil
/**
 *  通过NSPredicate过滤器，使用正则表达式判断是否为电话号码
 *
 *  [pred evaluateWithObject:str]判断一组字符是不是纯数字
 *  hasPrefix:方法的功能是判断创建的字符串内容是否以某个字符开始
 */
+ (BOOL)isPhoneNumber:(NSString *)str {
    NSString *regex = @"^1\\d{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str] || [str hasPrefix:@"123456"];
}
/**
 *  判断是否符合密码设置规范
 *
 *  char c = [str characterAtIndex:i]; 遍历数组，依次取出str的值的Unicode码
 *  @return 返回是否符合密码规范以及密码长度要大于6小于16
 */
+ (BOOL)isPassword:(NSString *)str {
    BOOL isMatch = true;
    for(int i=0; i<str.length; i++) {
        char c = [str characterAtIndex:i];
        if((c>='0'&&c<='9')||(c>='a'&&c<='z')||(c>='A'&&c<='Z')) {
        } else {
            isMatch = false;
            break;
        }
    }
    NSLog(@"str is %@, isMatch %d", str, isMatch);
    return isMatch&&str.length>=6&&str.length<=16;
}
/**
 *  判段是否是有效字符
 *  @return  返回判断结果
 */
+ (BOOL)isValidCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location==NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}
/**
 *  判断是否为空
 *  @return 返回判断str为nil或者@""的判断结果
 */
+ (BOOL)isEmpty:(NSString *)str {
    return str==nil||[str isEqualToString:@""];
}
/**
 *  判断家庭名称是否符合要求
 *  MBProgressHUD第三方框架 showError显示错误信息
 *  @return 返回isMatch的结果
 */
+ (BOOL)isMatchFamilyName:(NSString *)str {
    BOOL isMatch = false;
    if(str.length<1||str.length>10) {
        [MBProgressHUD showError:@"家庭名称必须是1~10个字符"];
    } else if (![SCStringUtil isValidCharact:str] || [SCStringUtil stringContainsEmoji:str]) {
        [MBProgressHUD showError:@"家庭名称中不能包含特殊字符"];
    } else {
        isMatch = true;
    }
    return isMatch;
}
/**
 *   判断家庭的描述是否符合要求
 *  @return 同上
 */
+ (BOOL)isMatchFamilyDesc:(NSString *)str {
    BOOL isMatch = false;
    if(str.length>50) {
        [MBProgressHUD showError:@"家庭描述过长，请控制在50字符以内"];
    } else if (![SCStringUtil isValidCharact:str] || [SCStringUtil stringContainsEmoji:str]) {
        [MBProgressHUD showError:@"家庭描述中不能包含特殊字符"];
    } else {
        isMatch = true;
    }
    return isMatch;
}
/**
 判断用户昵称是否符合要求
 */
+ (BOOL)isMatchUserNick:(NSString *)str {
    BOOL isMatch = false;
    if(str.length>8) {
        [MBProgressHUD showError:@"用户昵称必须是8个字符以内"];
    }else if (str.length<1){
        [MBProgressHUD showError:@"用户昵称不能为空"];
    }else if (![SCStringUtil isValidCharact:str] || [SCStringUtil stringContainsEmoji:str] ) {
        [MBProgressHUD showError:@"用户昵称中不能包含特殊字符"];
    } else {
        isMatch = true;
    }
    return isMatch;
}
/**
 判断用户备注是否符合要求
 */
+ (BOOL)isMatchUserNote:(NSString *)str {
    BOOL isMatch = false;
    if(str.length>6) {
        [MBProgressHUD showError:@"用户备注必须是0~6个字符"];
    } else if (![SCStringUtil isValidCharact:str] || [SCStringUtil stringContainsEmoji:str]) {
        [MBProgressHUD showError:@"用户备注中不能包含特殊字符"];
    } else {
        isMatch = true;
    }
    return isMatch;
}

+ (BOOL)isMatchUserSign:(NSString *)str {
    BOOL isMatch = false;
    if(str.length<3||str.length>50) {
        [MBProgressHUD showError:@"用户签名必须是3~50个字符"];
    } else if (![SCStringUtil isValidCharact:str] || [SCStringUtil stringContainsEmoji:str]) {
        [MBProgressHUD showError:@"用户签名中不能包含特殊字符"];
    } else {
        isMatch = true;
    }
    return isMatch;
}
/**
 *   将string转为date
 *  先判断dateString是否为空；然后设置date格式，将字符串数据dateString转换为date并传出
 *  @return 返回date数据
 */
+ (NSDate *)dateFromString:(NSString *)dateString {
    if([self isEmpty:dateString]) {
        dateString = @"1990-01-01 00:00:00";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd hh:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}
/**
 *  判断是否为当天，并返回BOOL值
 *  [NSDate date]获取当前时间
 将date数据转换为string 并用isEqualToString判断
 */
+ (BOOL)isToday:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    if([[formatter stringFromDate:date] isEqualToString:[formatter stringFromDate:[NSDate date]]]) {
        return YES;
    } else {
        return NO;
    }
}
/**
 *  判断是否为当天时间；若为以hh:mm格式将date转化为string；若不为以yyyy-MM-dd格式将date转化为string
 *  @return 返回date转化后的string数据
 */
+ (NSString *)simpleStringFromDate:(NSDate *)date {
    if(date==nil) {
        return @"1990-01-01 00:00:00";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if([self isToday:date]) {
        [formatter setDateFormat:@"hh:mm"];
    } else {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    return [formatter stringFromDate:date];
}
/**
 *  将date转化为string；格式为yyyy-MM-dd hh:mm:ss
 */
+ (NSString *)stringFromDate:(NSDate *)date {
    if(date==nil) {
        return @"1990-01-01 00:00:00";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    return [formatter stringFromDate:date];
}
//以yyyy_MM_dd_hh_mm_ss格式将当天时间date转化为string输出
+ (NSString *)stringFromCurrentDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy_MM_dd_hh_mm_ss"];
    return [formatter stringFromDate:[NSDate date]];
}
/**
 *  将时间戳转化为简单string格式
 *  dateWithTimeIntervalSince1970以GMT时间的偏移秒数来初始化date
 ！！！？？？ 不懂 [timeStamp doubleValue]/1000的意思
 返回简单string格式的时间戳date数据
 */
+ (NSString *)simpleStringFromTimeStamp:(NSNumber *)timeStamp {
    NSLog(@"time double value %f", [timeStamp doubleValue]);
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]/1000];
    return [self simpleStringFromDate:date];
}
//将时间戳转化为正常string格式(有hh_mm_ss)
+ (NSString *)stringFromTimeStamp:(NSNumber *)timeStamp {
    NSLog(@"time double value %f", [timeStamp doubleValue]);
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]/1000];
    return [self stringFromDate:date];
}
/**
 *判断输入时间和今天时间的差距
 *TIME_DAY_ONE    (24 * 60 * 60)一天的秒数
 */
+ (NSString *)compareDateToToday:(NSString *)dateString {
    int interval = [[self intervalDayFromToday:dateString] intValue];
    if(interval/TIME_DAY_ONE==0) {
        return @"今天";
    } else if (interval/TIME_DAY_ONE==1) {
        return @"明天";
    } else if (interval/TIME_DAY_ONE==2) {
        return @"后天";
    } else {
        return [NSString stringWithFormat:@"还有%d天", interval/TIME_DAY_ONE];
    }
}
/**
 *  返回今天和输入日期的时间间隔
 *  字符范围替换为指定的字符串,返回新的字符串。
 stringByReplacingCharactersInRange:NSMakeRange(11, 8) withString:@"00:00:00"
 *  NSMakeRange(loc,len)(位置，长度)表示字符串要传进来从哪里开始的位置和需要的长度。
 将todayString定位到第11位，并将其后面8位用@"00:00:00"替换
 字符串截取到第n位  （substringToIndex: n）(第n 位不算再内)
 - (NSDate *)earlierDate:(NSDate *)anotherDate;
 与anotherDate比较，返回较早的那个日期
 */
+ (NSNumber *)intervalDayFromToday:(NSString *)dateString {
    if([self isEmpty:dateString]) {
        dateString = @"1990-01-01 00:00:00";
    }
    NSString *todayString = [[self stringFromDate:[NSDate date]] stringByReplacingCharactersInRange:NSMakeRange(11, 8) withString:@"00:00:00"];//当前的年月日；置空时分秒
    int year = [[dateString substringToIndex:4] intValue];//输入时间的年
    NSDate *destDate;
    NSDate *todayDate;
    year--;
    do {
        year ++;
        dateString = [dateString stringByReplacingCharactersInRange:NSMakeRange(0, 4) withString:[NSString stringWithFormat:@"%d", year]];//递增输入时间的年；直到当年
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"yyyy-MM-dd hh:mm:ss"];
        
        destDate= [dateFormatter dateFromString:dateString];//输入时间
        todayDate = [dateFormatter dateFromString:todayString];//当天时间
    } while ([destDate earlierDate:todayDate]!=todayDate);//使deatDate大于todayDate
    NSTimeInterval destInterval = [destDate timeIntervalSince1970];
    NSTimeInterval todayInterval = [todayDate timeIntervalSince1970];
    int interval = (int)(destInterval-todayInterval);
    NSLog(@"dest %d, today %d, dest - today %d", (int)destInterval, (int)todayInterval, interval);
    return [NSNumber numberWithInt:interval];
}
//将JSON数据反序列化；将其转化为dictionary
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
//用""代替versionName的"."
+ (int)getCodeByName:(NSString *)versionName {
    return [[versionName stringByReplacingOccurrencesOfString:@"." withString:@""] intValue];
}
//获取App应用版本
+ (NSString *)getAppBundleVersionShort {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
//获取App应用build版本
+ (NSString *)getAppBundleVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}
//UIDevice获取设备相关信息
//获取系统版本号
+ (NSString *)getSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}
/**获取YYYY-MM-dd hh:mm:ss:SSS样式的string格式的今天日期*/
+ (NSString *)getTimeNow {
    NSString* date;
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
    date = [formatter stringFromDate:[NSDate date]];
    NSString *timeNow = [[NSString alloc] initWithFormat:@"%@", date];
    return timeNow;
    
}
/**
 *  componentsSeparatedByString将string字符串切割成array数组
 */
+ (NSDictionary *)getUrlParams:(NSString *)url {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSArray *urlArray = [url componentsSeparatedByString:@"?"];
    NSString *paramString = urlArray.count>=2 ? [urlArray objectAtIndex:1] : url;//获取url数组的一个参数值
    NSArray *paramsArray = [paramString componentsSeparatedByString:@"&"];//将从url中获取的参数值切割成数组
    for(int i=0; i<[paramsArray count]; i++) {
        NSString *keyAndValueString = [paramsArray objectAtIndex:i];
        NSArray *keyAndValueArray = [keyAndValueString componentsSeparatedByString:@"="];
        if(keyAndValueArray.count>=2) {
            [params setObject:keyAndValueArray[1] forKey:keyAndValueArray[0]];//构造字典（？？？？）不知道这里字典存储url的params干嘛？？？
        }
    }
    return params;
}

+ (NSString *)getRealString:(NSString *)string {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[(\\w+)\\]" options:0 error:nil];
    NSArray* matches = [regex matchesInString:string
                                      options:NSMatchingWithoutAnchoringBounds
                                        range:NSMakeRange(0, string.length)];
    for (NSTextCheckingResult* result in [matches reverseObjectEnumerator]) {
        NSRange matchRange = [result range];
        NSString *placeholder = [string substringWithRange: matchRange];
        if(placeholder.length>=3&&placeholder.length<=5) {
            NSString *plistStr = [[NSBundle mainBundle]pathForResource:@"expression" ofType:@"plist"];
            NSDictionary *plistDic = [[NSDictionary  alloc]initWithContentsOfFile:plistStr];
            for (int j = 0; j<[[plistDic allKeys] count]; j++) {
                NSString *faceName = [[plistDic allKeys] objectAtIndex:j];
                if ([faceName isEqualToString:placeholder]) {
                    NSString *pic = [plistDic objectForKey:[[plistDic allKeys] objectAtIndex:j]];
                    NSString *picName = [pic substringToIndex:pic.length-7];
                    string = [string stringByReplacingCharactersInRange:matchRange withString:[NSString stringWithFormat:@"[e(%@)e]", picName]];
                }
            }
        }
    }
    return string;
}
//是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}


@end