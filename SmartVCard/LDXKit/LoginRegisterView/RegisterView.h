//
//  RegisterView.h
//  php
//
//  Created by 李东旭 on 16/3/10.
//  Copyright © 2016年 李东旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView

@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UITextField *nameTextF;
@property (nonatomic, strong) UITextField *passTextF;
@property (nonatomic, strong) UITextField *ageTextF;
@property (nonatomic, strong) UITextField *telephoneF;

// 返回按钮
@property (nonatomic, strong) UIButton *backButton;

// 用户头像
@property (nonatomic, strong) UIButton *headerImageButton;

@end
