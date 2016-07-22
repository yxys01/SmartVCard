//
//  SCUserTableViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/15.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCUserTableViewController.h"
#import "UserInfo.h"
#import "SCUserDefaults.h"
#import "MBProgressHUD+MJ.h"

@interface SCUserTableViewController()<UINavigationControllerDelegate>



@end


@implementation SCUserTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
/**
 *  选中某Cell后获取其Cell实例对象
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    

}

-(void)initViews{
    
}


@end
