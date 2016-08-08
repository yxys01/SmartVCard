//
//  ContactModel.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/1.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "ContactModel.h"
#import "NSString+Utils.h"
@implementation ContactModel
-(void)setName:(NSString<Optional>*)name{
    if(name){
        _name = name;
        _pinyin = _name.pinyin;
    }
}


-(instancetype)initWithDic:(NSDictionary *)dic{
    NSError *error = nil;
    self = [self initWithDictionary:dic error:&error];
    return self;
}


@end
