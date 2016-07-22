//
//  SCDBHelper.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "UserInfo.h"
#define kTableNameUserInfo @"UserInfo"

@interface SCDBHelper : NSObject

+ (instancetype)sharedInstance;

- (BOOL)isTableExist:(NSString *)tableName;

- (UserInfo *)getUserInfoFromDB:(NSNumber *)uID;
- (void)setUserInfoInDB:(UserInfo *)userInfo;
- (void)clearUserInfoInDB;
@end
