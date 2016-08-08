//
//  SCCustomDesignTableViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/2.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCCustomDesignTableViewController.h"
#import "SCTabBarController.h"
@interface SCCustomDesignTableViewController()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation SCCustomDesignTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.title = @"自定义名片";

}
-(void)loadView
{
    [super loadView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    return;
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];

//    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source
/**选中某Cell后获取其Cell实例对象*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"index path %ld, %ld", (long)indexPath.section, (long)indexPath.row);
    if(indexPath.section==0&&indexPath.row==0)
    {
    
    
    }else if(indexPath.section == 4)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CardBuild" bundle:nil];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[storyboard instantiateInitialViewController]];
        [self presentViewController:nav animated:YES completion:nil];
    }
}

@end
