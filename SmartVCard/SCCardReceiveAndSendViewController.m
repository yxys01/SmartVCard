//
//  SCCardReceiveAndSendViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/4.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCCardReceiveAndSendViewController.h"

@interface SCCardReceiveAndSendViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ReceiveBtn;
@property (weak, nonatomic) IBOutlet UIButton *SendBtn;

@end

@implementation SCCardReceiveAndSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initButton:_SendBtn image:[UIImage imageNamed:@"Send"] title:@"发送名片" titleColor:[UIColor colorWithRed:0.334 green:0.231 blue:1.000 alpha:1.000] backgroundColor:[[UIColor colorWithRed:0.887 green:1.000 blue:0.237 alpha:1.000] colorWithAlphaComponent:0.8]];
    
    [self initButton:_ReceiveBtn image:[UIImage imageNamed:@"received2"] title:@"接受名片" titleColor:[UIColor colorWithRed:0.824 green:0.969 blue:1.000 alpha:1.000] backgroundColor:[[UIColor colorWithRed:0.065 green:1.000 blue:0.018 alpha:0.648] colorWithAlphaComponent:0.8]];

}
-(void)initButton:(UIButton *)btn image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)bgColor
{
    [btn setImage:image forState:UIControlStateNormal];

    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor: titleColor forState:UIControlStateNormal];
    
    [self initButton:btn];
    
    btn.layer.cornerRadius = 4.5;
    
    btn.backgroundColor = bgColor;


}
-(void)initButton:(UIButton*)btn{
    //使图片和文字水平居中显示
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height +50,-btn.imageView.frame.size.width, 0.0,0.0)];
    //图片距离右边框距离减少图片的宽度，其它不边
    [btn setImageEdgeInsets:UIEdgeInsetsMake(-30, 0.0,0.0, -btn.titleLabel.bounds.size.width)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
