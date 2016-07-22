//
//  Common.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//宏定义文件
//
//#ifndef ____1105_Common_h
//#define ____1105_Common_h
#import <Foundation/Foundation.h>
#define kIsRelease

@interface Common : NSObject {
}

@end
extern NSString* const kHttpPrix;


#if defined(kIsRelease)
#define kChatKey                @"yyjdelete-test#test001"
#define kCertName               @"ChangHong"
#define kCirclePath             @"http://life.chphone.cn/share2"
#else
#define kChatKey                @"yyjdelete-test#dev001"
#define kCertName               @"ChangHongDev"
#define kCirclePath             @"http://life.chphone.cn/share2"
#endif

#define ShareUrlHeader          @"http://life.chphone.cn/share/Circle/html/threadDetail.html"
#define kChannel @"appStore"

#define KDownUserPicUrl(UID) [NSString stringWithFormat:@"%@api/UserAvatar?pid=%@&key=%@",kHttpPrix,UID,[CHUserDefaults getFileToken]]//下载用户头像的urlString

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] <= 7.0)
#define IOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define color38 [UIColor colorWithWhite:0.166 alpha:1.000]
#define Font_STYLE_18 [UIFont systemFontOfSize:18]
#define Font_STYLE_16 [UIFont systemFontOfSize:16]
#define Font_STYLE_15 [UIFont systemFontOfSize:15]
#define Font_STYLE_14 [UIFont systemFontOfSize:14]

#define DatabaseName @"SmallLife.sqlite"
#define timeForOut 60

#define TABBAR_HEIGHT       62

#ifdef DEBUG
#define MKLog(...) //NSLog(__VA_ARGS__)
//for background task upload
#define HttpLog(...)//NSLog(__VA_ARGS__)
#define LocationLog(...) NSLog(__VA_ARGS__)
#else
#define MKLog(...)
#define HttpLog(...)
#define LocationLog(...)
#endif

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define Screenwidth [UIScreen mainScreen].bounds.size.width

#define COLOR_STYLE_RED     [UIColor colorWithRed:209.0/255.0 green:88.0/255.0 blue:53.0/255.0 alpha:1.0]
#define COLOR_STYLE_GRAY    [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]
#define COLOR_STYLE_BACK    [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0]
#define COLOR_STYPE_HINT    [UIColor colorWithRed:199.0/255.0 green:199.0/255.0 blue:204.0/255.0 alpha:1.0]
#define COLOR_STYLE_WHITE   [UIColor colorWithWhite:0.973 alpha:1.000]
#define SINGE_MEMBER_INFO @"singe_member_info"

#define NOTIFICATION_FAMILY_CHANGED         @"NOTIFICATION_FAMILY_CHANGED"
//extern NSString* const NOTIFICATION_FAMILY_CHANGED;
#define NOTIFICATION_MEMBER_CHANGED         @"NOTIFICATION_MEMBER_CHANGED"
#define NOTIFICATION_USERINFO_CHANGED       @"NOTIFICATION_USERINFO_CHANGED"
#define NOTIFICATION_NOTIFICATION_CHANGED   @"NOTIFICATION_NOTIFICATION_CHANGED"
#define NOTIFICATION_USEREXP_CHANGED        @"NOTIFICATION_USEREXP_CHANGED"
#define NOTIFICATION_FAMILYDATE_CHANGED     @"NOTIFICATION_FAMILYDATE_CHANGED"
#define NOTIFICATION_DIDDETLE_PIC           @"NOTIFICATION_DIDDETLE_PIC"
#define NOTIFICATION_UPLOAD_SUCCESS         @"NOTIFICATION_UPLOAD_SUCCESS"

#define TIME_DAY_ONE    (24 * 60 * 60)

//#endif