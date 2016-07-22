//
//  SCDBHelper.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCDBHelper.h"
#import "NSObject+MJMember.h"
#import "Common.h"
@interface SCDBHelper()

@property(nonatomic,retain)FMDatabaseQueue *dataBase;

@end

@implementation SCDBHelper

@synthesize dataBase = _dataBase;

static SCDBHelper *scDbHelper = nil;

+(instancetype)sharedInstance{
    @synchronized (self) {
        if(scDbHelper == nil){
            scDbHelper = [[self alloc]init];
        }
    }
    return scDbHelper;
}

//线程安全
-(FMDatabaseQueue *)dataBase{
    if(!_dataBase){
        NSString *Path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:DatabaseName];
        _dataBase = [FMDatabaseQueue databaseQueueWithPath:Path];
    }
    return _dataBase;
}

//判断表名是否存在
-(BOOL)isTableExist:(NSString *)tableName{
    __block int num = 0;
    [self.dataBase inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select count(*) as c from Sqlite_master where type ='table' and name ='%@';", tableName]];
        if(!rs.next){
            return;
        }
        num = [rs intForColumn:@"c"];
        [rs close];
    }];
    return num;
}

#pragma mark TABLE USERINFO
-(UserInfo *)getUserInfoFromDB:(NSNumber *)uID{
    __block UserInfo *userinfo = nil;
    [self.dataBase inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"select * from UserInfo where ID = ?;", uID];
        if (!rs.next) {
            return ;
        }
        UserInfo *user = [[UserInfo alloc] init];
        [user enumerateIvarsWithBlock:^(MJIvar *ivar, BOOL *stop) {
            NSString *name = ivar.propertyName;
            if (ivar.type.typeClass == [NSNumber class]) {
                ivar.value = [NSNumber numberWithDouble:[rs doubleForColumn:name]];
            }
            if (ivar.type.typeClass == [NSString class]) {
                ivar.value = [rs stringForColumn:name];
            }
        }];
        [rs close];
        userinfo = user;
    }];
    return userinfo;
}

- (void)setUserInfoInDB:(UserInfo *)userInfo {
    if(![self isTableExist:kTableNameUserInfo]) {
        NSLog(@"user info db is not exist");
        [self createUserInfoTable];
    }
    if([self getUserInfoFromDB:userInfo.ID]!=nil) {
        NSLog(@"user info data exist");
        [self deleteUserInfoData:userInfo.ID];
    }
    [self insertUserInfoInDB:userInfo];
}

- (void)createUserInfoTable {
    [self.dataBase inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"create table if not exists UserInfo (ID integer primary key,CName text,LogoUrl text,BackgroundUrl text,Area text,HomePage text,TDCodeUrl text,WeChat text,Email text,CompanyName text,Position text,Gender integer,qq integer,Tel integer,Phone integer);"];
        NSLog(@"create table UserInfo %d", result);
    }];
}

- (void)deleteUserInfoData:(NSNumber *)uID {
    [self.dataBase inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"delete from UserInfo where ID = ?;", uID];
        NSLog(@"delete table user info result %d", result);
    }];
}

- (void)insertUserInfoInDB:(UserInfo *)userInfo {
    [self.dataBase inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"insert into UserInfo (ID,CName,LogoUrl,BackgroundUrl,Area,HomePage,TDCodeUrl,WeChat,Email,CompanyName,Position,Gender,qq,Tel,Phone) values (?,?,?,?,? ,?,?,?,?,?, ?,?,?,?,?, ?,?);",
                       userInfo.ID,
                       userInfo.CName,
                       userInfo.EName,
                       userInfo.LogoUrl,
                       userInfo.BackgroundUrl,
                       userInfo.Area,
                       userInfo.HomePage,
                       userInfo.TDCodeUrl,
                       userInfo.WeChat,
                       userInfo.Email,
                       userInfo.CompanyName,
                       userInfo.Position,
                       userInfo.Gender,
                       userInfo.qq,
                       userInfo.Tel,
                       userInfo.Phone
                       ];
        NSLog(@"insert user info into db %d", result);
    }];
}

- (void)clearUserInfoInDB {
    [self.dataBase inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"delete from UserInfo;"];
        NSLog(@"delete table user info result %d", result);
    }];
}

@end
