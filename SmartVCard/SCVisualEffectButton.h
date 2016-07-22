//
//  SCVisualEffectButton.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCVisualEffectButton : UIButton

+ (instancetype)effectButtonWithImage:(UIImage *)image Title:(NSString *)title target:(id)target selector:(SEL)selector;

@end
