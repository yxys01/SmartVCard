//
//  SCAboutViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/19.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCAboutViewController.h"
#import "SCStringUtil.h"


@interface SCAboutViewController ()

@property (weak, nonatomic) IBOutlet UILabel *versionLabel;

@end

@implementation SCAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.versionLabel.text = [NSString stringWithFormat:@"%@_%@", [SCStringUtil getAppBundleVersionShort], [SCStringUtil getAppBundleVersion]];
    // Do any additional setup after loading the view.
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
