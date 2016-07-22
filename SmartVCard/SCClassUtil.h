//
//  SCClassUtil.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface SCClassUtil : NSObject
/**返回当前类的所有属性*/
+ (NSMutableArray*)getProperties:(Class)cls;
@end