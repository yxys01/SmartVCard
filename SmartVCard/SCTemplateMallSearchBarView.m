//
//  SCTemplateMallSearchBarView.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/5.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCTemplateMallSearchBarView.h"
#import "SCTemplateMallModel.h"
#import "SQMacro.h"

@interface SCTemplateMallSearchBarView ()

@property (nonatomic,strong) UITextField * searchBarTextField;
@property (nonatomic,strong) UIImageView * magnifierImageView;

@end


@implementation SCTemplateMallSearchBarView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder  {
    
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (UITextField *)searchBarTextField {
    
    if (!_searchBarTextField) {
        _searchBarTextField = [UITextField new];
        _searchBarTextField.backgroundColor = [UIColor whiteColor];
        _searchBarTextField.layer.borderColor = KC05_dddddd.CGColor;
        _searchBarTextField.layer.borderWidth = 0.5f;
        _searchBarTextField.layer.cornerRadius = 5;
        _searchBarTextField.layer.masksToBounds= YES;
        _searchBarTextField.placeholder = kSearchBarPlaceholder;
        _searchBarTextField.leftView = self.magnifierImageView;
        _searchBarTextField.leftViewMode = UITextFieldViewModeAlways;
        [_searchBarTextField setValue:KC04_999999 forKeyPath:@"placeholderLabel.textColor"];
    }
    return _searchBarTextField;
}

- (UIImageView *)magnifierImageView {
    
    if (!_magnifierImageView) {
        _magnifierImageView = [UIImageView new];
        _magnifierImageView.image = [UIImage imageNamed:kLifestyle_magnifier];
        _magnifierImageView.frame = CGRectMake(0, 0, 34, 34);
        _magnifierImageView.contentMode = UIViewContentModeCenter;
    }
    return _magnifierImageView;
}

- (void)setupSubviews {
    [self addSubview:self.searchBarTextField];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat searchBarTextFieldX = 0;
    CGFloat searchBarTextFieldY = 5;
    CGFloat searchBarTextFieldW = self.width;
    CGFloat searchBarTextFieldH = 34;
    self.searchBarTextField.frame = CGRectMake(searchBarTextFieldX, searchBarTextFieldY, searchBarTextFieldW, searchBarTextFieldH);
}


@end
