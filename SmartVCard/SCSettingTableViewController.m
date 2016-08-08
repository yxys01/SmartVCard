//
//  SCSettingTableViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/15.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCSettingTableViewController.h"
#import "SCUserDefaults.h"
#import "SCStringUtil.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "AFNetworking.h"
#import "SCDBHelper.h"

typedef void(^UpdateApp) (BOOL shouldUpdateApp);


@interface SCSettingTableViewController ()<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *notificationSwith;
@property (weak, nonatomic) IBOutlet UISwitch *voiceSwith;

@property (strong, nonatomic) NSString *trackViewUrl;

@property (strong, nonatomic) UpdateApp updateApp;

@end

@implementation SCSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#warning 更新
-(void)update{
    NSURL *url = [NSURL URLWithString:self.trackViewUrl];
    [[UIApplication sharedApplication]openURL:url];
}

-(void)initViews{
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 20)];
    [self.notificationSwith setOn:![SCUserDefaults getReceiveNotificationOff]];
    [self.voiceSwith setOn:![SCUserDefaults getNotificationAlarmOff]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**接收通知*/
- (IBAction)notificationSwitchValueChanged:(id)sender {
    BOOL isSelected = ((UISwitch *)sender).isOn;
    [SCUserDefaults setIsReceiveNotificationOff:!isSelected];
}
/**声音提醒*/
- (IBAction)voiceSwitchValueChanged:(id)sender {
    BOOL isSelected = ((UISwitch *)sender).isOn;
    [SCUserDefaults setIsNotificationAlarmOff:!isSelected];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==4&&indexPath.row==0) {
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"退出账户"
                                                       message:@"您确定要退出账户"
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"确定", nil];
        [alert setTag:1];
        [alert show];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(alertView.tag==0) {
        if(buttonIndex==1) {
            NSURL *url= [NSURL URLWithString: self.trackViewUrl];
            [[UIApplication sharedApplication] openURL:url];
        }
    } else if (alertView.tag==1) {
        if(buttonIndex==1) {
            [self logout];
        }
    }
}

-(void)logout{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login&Register" bundle:nil];
    [self presentViewController:[storyboard instantiateInitialViewController] animated:YES completion:nil];

}


@end
