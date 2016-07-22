//
//  TabBarView.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "TabBarView.h"

#import "TabBarView.h"
#import "MKButton.h"

@interface TabBarView()

@end

@implementation TabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [centerButton setImage:[UIImage imageNamed:@"mn_add"] forState:UIControlStateNormal];
        [centerButton setImage:[UIImage imageNamed:@"mn_add"]forState:UIControlStateHighlighted];
        UIImage *image = [UIImage imageNamed:@"mn_add"];
        centerButton.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
        centerButton.imageView.contentMode = UIViewContentModeCenter;
        centerButton.clipsToBounds = NO;
        [centerButton addTarget:self action:@selector(centerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:centerButton];
        self.centerButton = centerButton;//这里把button添加到view后为何还要添加到其属性里面？
    }
    return self;
}
/**给按钮增加背景图片；高亮图片*/
- (MKButton *)addButtonWithImage:(NSString *)imageName HImage:(NSString *)HimageName {
    MKButton *btn = [MKButton buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:HimageName] forState:(UIControlStateSelected)];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchDown)];
    [self addSubview:btn];
    
    return btn;
}

- (void)centerButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tabBarView:centerButtonDidClick:)]) {
        [self.delegate tabBarView:self centerButtonDidClick:sender];
    }
}

- (void)buttonClicked:(int)index {
    [self buttonClick:(MKButton *)[self.selectButtons objectAtIndex:index]];
}

- (void)buttonClick:(MKButton*)button {
    if ([self.delegate respondsToSelector:@selector(tabBarView:ClickButtonFrom:To:)]) {
        if([self.delegate tabBarView:self ClickButtonFrom:self.frontButton To:button]) {
            button.selected = YES;
            
            if (self.frontButton == button) {
                self.frontButton.selected = YES;
            } else {
                self.frontButton.selected = NO;
            }
            self.frontButton = button;
        }
    }
    
}
/**显示新通知*/
- (void)showBadgeAtIndex:(int)index {
    int ButtonCount = (int)self.selectButtons.count;
    for (int i = 0; i < ButtonCount; i++) {
        NSLog(@"button count %d", ButtonCount);
        if(i==index) {
            UIImageView *dotImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red_point"]];
            dotImage.backgroundColor = [UIColor clearColor];
            dotImage.tag = 888;
            CGRect tabFrame = ((MKButton *)self.subviews[index]).frame;
            NSLog(@"tab frame %f,%f,%f,%f", tabFrame.origin.x, tabFrame.origin.y, tabFrame.size.width, tabFrame.size.height);
            CGFloat x = ceilf(0.7 * tabFrame.size.width);
            CGFloat y = ceilf(0.1 * tabFrame.size.height);
            dotImage.frame = CGRectMake(x, y, 6, 6);
            if(x!=0&&y!=0) {
                [((MKButton *)self.selectButtons[index]) addSubview:dotImage];
            }
        }
    }
}
/**遍历subviews；当tag==888时，移除其superview*/
- (void)hideBadgeAtIndex:(int)index {
    int ButtonCount = (int)self.subviews.count;
    NSLog(@"subviews:%@",self.subviews);
    for (int i = 0; i < ButtonCount; i++) {
        if(i==index) {
            for(UIView *view in ((MKButton *)self.selectButtons[index]).subviews) {
                if(view.tag==888) {
                    [view removeFromSuperview];
                }
            }
        }
    }
}
/**提取subviews中MKButton类型的对象
 将对象添加到数组中
 返回这个数组
 */
- (NSArray *)selectButtons {
    if (!_selectButtons) {
        NSMutableArray *btns = [NSMutableArray array];
        for (int i = 0; i < self.subviews.count; i++) {
            if ([self.subviews[i] isKindOfClass:[MKButton class]]) {
                [btns addObject:self.subviews[i]];
            }
        }
        _selectButtons = btns;
    }
    return _selectButtons;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    int ButtonCount = (int)self.selectButtons.count;
    for (int i = 0; i < ButtonCount; i++) {
        CGFloat countY = 0;
        CGFloat countW = self.bounds.size.width/(ButtonCount + 1);
        CGFloat countX;
        if (i < ButtonCount/2) {
            countX = countW * i;
        }else {
            countX = countW * (i + 1);
        }
        CGFloat countH = self.bounds.size.height;
        CGRect rect = CGRectMake(countX, countY, countW, countH);
        MKButton* btn = self.selectButtons[i];
        btn.frame = rect;
        btn.tag = i;
    }
    MKButton *btn = [self.selectButtons objectAtIndex:0];
    [self buttonClick:btn];
    self.frontButton = btn;
    UIImage *image = [UIImage imageNamed:@"mn_add"];
    CGFloat h = self.bounds.size.height/2;
    CGFloat w = self.frame.size.width;
    _centerButton.center = CGPointMake(w * 0.5,h);
}
@end
