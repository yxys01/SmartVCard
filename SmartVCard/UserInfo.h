//
//  UserInfo.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
/**
 *  描述用户登录的基本信息
 */
@property(nonatomic,strong)NSNumber *ID;//用户ID
@property(nonatomic,strong)NSString *CName;//中文名
@property(nonatomic,strong)NSString *EName;//英文名
@property(nonatomic,strong)NSString *LogoUrl;//Logo图片
@property(nonatomic,strong)NSString *BackgroundUrl;//背景图片
@property(nonatomic,strong)NSString *Area;//地址
@property(nonatomic,strong)NSString *HomePage;//个人主页
@property(nonatomic,strong)NSString *TDCodeUrl;//二维码
@property(nonatomic,strong)NSString *WeChat;//微信
@property(nonatomic,strong)NSString *Email;//邮箱
@property(nonatomic,strong)NSString *CompanyName;//公司名
@property(nonatomic,strong)NSString *Position;//职位
@property(nonatomic,strong)NSNumber *Gender;//性别{true：男；false：女；nil：未设置}
@property(nonatomic,strong)NSNumber *qq;//QQ
@property(nonatomic,strong)NSNumber *Tel;//手机号
@property(nonatomic,strong)NSNumber *Phone;//座机号

+ (instancetype)sharedInstance;
+ (UserInfo *)initUserInfoWithDict:(NSDictionary*)dict;

- (void)setMeUser:(UserInfo *)uInfo;

@end
