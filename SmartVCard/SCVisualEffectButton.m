//
//  SCVisualEffectButton.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCVisualEffectButton.h"
#import "Common.h"

#define Kwidth  self.bounds.size.width
#define Kheight self.bounds.size.height
#define padding 10

@implementation SCVisualEffectButton
/**
 *  设置VisualEffectButton的属性
 *
 *  @param image    图片名
 *  @param title    标题
 *  @param target   tag
 *  @param selector 方法名
 *
 *  @return 返回CHVisualEffectButton
 */
+ (instancetype)effectButtonWithImage:(UIImage *)image Title:(NSString *)title target:(id)target selector:(SEL)selector {
    
    SCVisualEffectButton *button = [SCVisualEffectButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = Font_STYLE_16;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}

/**改变title文字的位置,构造title的矩形*/
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat height = [@"十四" sizeWithAttributes:@{NSFontAttributeName:Font_STYLE_16}].height;
    
    return CGRectMake(0, Kwidth , Kwidth, height);
}
/**重写方法,改变图片的位置,在titleRect..方法后执行*/
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, 0, Kwidth, Kwidth);
}
@end
