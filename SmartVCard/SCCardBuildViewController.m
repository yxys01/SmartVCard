//
//  SCCardBuildViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/4.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCCardBuildViewController.h"
#import "SCCustomDesignTableViewController.h"
@interface SCCardBuildViewController ()

@end

@implementation SCCardBuildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backBtn)];
    // Do any additional setup after loading the view.
}

-(void)backBtn{

    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
