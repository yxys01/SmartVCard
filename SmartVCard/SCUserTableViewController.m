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
#import "SCSettingTableViewController.h"
#import "SCTemplateMallViewController.h"
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 0 && indexPath.row ==0){
        
    }else if(indexPath.section == 2){
        
        self.hidesBottomBarWhenPushed = YES;
        SCTemplateMallViewController *vc = [[UIStoryboard storyboardWithName:@"Template_Mall" bundle:nil]instantiateInitialViewController];
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    
    }else  if(indexPath.section == 3)
    {
        SCSettingTableViewController *vc = [[UIStoryboard storyboardWithName:@"Setting" bundle:nil]instantiateInitialViewController];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)initViews{
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 20)];
}


@end
