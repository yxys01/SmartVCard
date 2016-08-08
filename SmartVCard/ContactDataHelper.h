//
//  ContactDataHelper.h
//  SmartVCard
//
//  Created by 夏天 on 16/8/1.
//  Copyright © 2016年 夏天. All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 *  格式化联系人列表
 */

@interface ContactDataHelper : NSObject

+ (NSMutableArray *) getFriendListDataBy:(NSMutableArray *)array;
+ (NSMutableArray *) getFriendListSectionBy:(NSMutableArray *)array;

@end
