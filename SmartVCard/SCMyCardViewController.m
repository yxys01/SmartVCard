//
//  SCMyCardViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/29.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCMyCardViewController.h"
#import "SCMyCardDesignCollectionViewController.h"
#import "SCMyCardDesignViewLayout.h"
#import "SCCustomDesignTableViewController.h"
@interface SCMyCardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *CardView;
- (IBAction)nextBtnClick:(id)sender;
- (IBAction)preBtnClick:(id)sender;
@property(nonatomic,assign)BOOL isPosition;
@property (nonatomic, assign) int index;
@end

@implementation SCMyCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isPosition = true;    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//正面
- (IBAction)nextBtnClick:(id)sender {
//    self.index++;
//    if (self.index >7) {
//        self.index = 1;
//    }
//    
//    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", self.index];
    if(!_isPosition){
    NSString *imageName = [NSString stringWithFormat:@"template_d1.jpg"];
    UIImage *newImage = [UIImage imageNamed:imageName];
    self.CardView.image = newImage;
    _isPosition = true;
    // 1.创建核心动画
    CATransition *ca = [CATransition animation];
    // 1.1动画过渡类型
    ca.type = @"cube";
    // 1.2动画过渡方向
    ca.subtype =  kCATransitionFromRight;
    // 1.3动画起点(在整体动画的百分比)
//    ca.startProgress = 0.5;
//    ca.endProgress = 0.5;
    
    
    // 动画时间
    ca.duration = 1;
    
    // 2.添加核心动画
    [self.CardView.layer addAnimation:ca forKey:nil];
    }
}
//背面
- (IBAction)preBtnClick:(id)sender {
//    self.index--;
//    if (self.index < 1) {
//        self.index = 7;
//    }
//    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", self.index];
    if(_isPosition){
    NSString *imageName = [NSString stringWithFormat:@"template_p1.jpg"];
    UIImage *newImage = [UIImage imageNamed:imageName];
    self.CardView.image = newImage;
    _isPosition = false;
    // 1.创建核心动画
    CATransition *ca = [CATransition animation];
    // 1.1告诉系统执行什么动画
    ca.type = @"cube";
    ca.subtype =  kCATransitionFromLeft;
    
    ca.duration = 1;
    
    // 2.添加核心动画
    [self.CardView.layer addAnimation:ca forKey:nil];
    }
}
@end
