//
//  ContactModel.h
//  SmartVCard
//
//  Created by 夏天 on 16/8/1.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "JSONModel.h"

@interface ContactModel : JSONModel

@property(nonatomic,strong)NSString<Optional>*portrait;
@property(nonatomic,strong)NSString<Optional>*name;
@property(nonatomic,strong)NSString<Ignore>*pinyin;//拼音

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
