//
//  SCUserDefaults.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCUserDefaults : NSObject


/**
 将用户登录的账号保存
 */
+ (void)saveUserName:(NSString *)uname;
+ (NSString *)getUserName;
/**
 将用户登录的密码保存
 */
+ (void)savePassword:(NSString *)pwd;
+ (NSString *)getPassword;
/**
 将用户的ID保存
 */
+ (void)saveUserID:(NSNumber *)uID;
+ (NSNumber *)getUserID;
/**
 将用户的Family ID保存
 */
+ (void)saveFamilyID:(NSNumber *)uID;
+ (NSNumber *)getFamilyID;
/**
 将用户的File Token保存
 */
+ (void)saveFileToken:(NSString *)fileToken;
+ (NSString *)getFileToken;
/**
 将用户的Token保存
 */
+ (void)saveToken:(NSString *)token;
+ (NSString *)getToken;
/**
 将用户的通知序列号保存msgCount
 */
+ (void)saveNoteStartActionIndex:(NSNumber *)index forUser:(NSNumber *)userID;
+ (NSNumber *)getNoteStartActionIndexforUser:(NSNumber *)userID;
/**
 将用户的通知序列号保存
 */
+ (void)saveNoteStartIndex:(NSNumber *)index forUser:(NSNumber *)userID;
+ (NSNumber *)getNoteStartIndexforUser:(NSNumber *)userID;
/**
 是否自动登录
 */
+ (void)setIsAutoLogin:(BOOL)autoLogin;
+ (BOOL)getIsAutoLogin;
/**
 将用户的接收通知设置保存
 */
+ (void)setIsReceiveNotificationOff:(BOOL)isReceiveOff;
+ (BOOL)getReceiveNotificationOff;
/**
 将用户的声音提醒设置保存
 */
+ (void)setIsNotificationAlarmOff:(BOOL)isAlarmOff;
+ (BOOL)getNotificationAlarmOff;
/**
 设置是否有新的通知到来
 */
+ (void)setHasNewNotification:(BOOL)hasNew;
+ (BOOL)getHasNewNotification;

+ (void)setHasNewNotiFamily:(BOOL)hasNew;

+ (BOOL)getHasNewNotiFamily;

+ (void)setHasNewNotiCircle:(BOOL)hasNew;

+ (BOOL)getHasNewNotiCircle;
/**
 是否来自于生活圈
 */
+ (void)setBackFromCircle:(BOOL)back;
+ (BOOL)getBackFromCircle;

/**
 是否来自于我的订单
 */
+ (void)setBackFromMyOrders:(BOOL)back;
+ (BOOL)getBackFromMyOrders;

/** 用户是否收藏某动态或取消收藏某动态 */
+ (void)setIsCircleCollectChanged:(BOOL)changed;
+ (BOOL)getCircleCollectChanged;
/** 用户是否发布或删除某条动态 */
+ (void)setIsCircleChanged:(BOOL)changed;
+ (BOOL)getCircleChanged;

@end
