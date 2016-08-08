//
//  SCCardSendViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/2.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCCardSendViewController.h"
#import "UIImage+SCCreateBarcode.h"

@implementation SCCardSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)createBarcode:(id)sender {
//    UIImage * image = [UIImage imageOfQRFromURL: @"https://appsto.re/cn/Jd2W-.i " codeSize: 1000 red: 0 green: 0 blue: 0 insertImage: [UIImage imageNamed: @"template_d1"] roundRadius: 15.0f];
    UIImage * image = [UIImage imageOfQRFromURL: @"https://www.baidu.com" codeSize: 1000 red: 0 green: 0 blue: 0 insertImage: [UIImage imageNamed: @"template_d1"] roundRadius: 15.0f];
    CGSize size = image.size;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:  ((CGRect){(CGPointZero), (size)})];
    imageView.center = self.view.center;
    imageView.image = image;
    [self.view addSubview: imageView];
}

@end
