//
//  TabBarView.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKButton;
@class TabBarView;

@protocol tabBarViewDelegate <UITabBarDelegate>

- (BOOL)tabBarView:(TabBarView*)tabBarView ClickButtonFrom:(MKButton*)from To:(MKButton*)to;

- (void)tabBarView:(TabBarView*)tabBarView centerButtonDidClick:(UIButton *)centerButton;

@end

@interface TabBarView : UIView
//MKButton是指什么？中间按钮？
@property (weak,nonatomic) MKButton* frontButton;
@property (strong, nonatomic) NSArray *selectButtons;
@property (weak,nonatomic) UIButton* centerButton;

@property (weak, nonatomic) id<tabBarViewDelegate> delegate;

- (MKButton*)addButtonWithImage:(NSString*)imageName HImage:(NSString*)HimageName;
- (void)buttonClicked:(int)index;
- (void)showBadgeAtIndex:(int)index;
- (void)hideBadgeAtIndex:(int)index;

@end