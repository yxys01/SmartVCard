//
//  UserInfo.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "UserInfo.h"
#import "FMDB.h"
#import "SCDBHelper.h"
#import "SCUserDefaults.h"
#import "NSObject+MJMember.h"
#import "SCClassUtil.h"


@implementation UserInfo

static UserInfo *userInfo;
//单例
+ (instancetype)sharedInstance {
    @synchronized(self) {
        if (userInfo == nil) {
            userInfo = [[self alloc] init];
        }
    }
    return userInfo;
}
//将字典映射到UserInfo对象
+ (UserInfo *)initUserInfoWithDict:(NSDictionary*)dict {
    if(dict==nil) return nil;
    UserInfo *uInfo = [[UserInfo alloc] init];
    
    NSMutableArray *mArray = [NSMutableArray array];
    mArray = [SCClassUtil getProperties:[self class]];
    
    for (int i = 0;i< [mArray count];i++ ) {
        NSString *str = [mArray objectAtIndex:i];
        NSArray *arr = [dict allKeys];
        if([arr containsObject:str])
        {
            [uInfo setValue:dict[str] forKey:str];
        }
    }
    
    return uInfo;
}

- (void)setMeUser:(UserInfo *)uInfo {
    userInfo = uInfo;
}
//重修description方法
- (NSString *)description {
    return [NSString stringWithFormat:@"{ID-%@,CName-%@,LogoUrl-%@,BackgroundUrl-%@,Area-%@,HomePage-%@,TDCodeUrl-%@,WeChat-%@,Email-%@,CompanyName-%@,Position-%@,Gender-%@,qq-%@,Tel-%@,Phone-%@}",self.ID,self.CName,self.LogoUrl,self.BackgroundUrl,self.Area,self.HomePage,self.TDCodeUrl,self.WeChat,self.Email,self.CompanyName,self.Position,self.Gender,self.qq,self.Tel,self.Phone];
    
}
@end
