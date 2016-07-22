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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if(alertView.tag==0) {
//        if(buttonIndex==1) {
//            NSURL *url= [NSURL URLWithString: self.trackViewUrl];
//            [[UIApplication sharedApplication] openURL:url];
//        }
//    } else if (alertView.tag==1) {
//        if(buttonIndex==1) {
//            [self logout];
//        }
//    }
//}
//
//- (void)logout {
//    [MBProgressHUD showMessage:@"正在退出"];
//    [CHHttpHelper doDelete:kApiNameLogout
//                    params:[[NSDictionary alloc] init]
//                   success:^(NSURLSessionDataTask *task, id response) {
//                       [MBProgressHUD hideHUD];
//                       NSNumber *state = response[@"State"];
//                       if ([state integerValue]==kHttpReturnSucc) {
//                           [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES completion:^(NSDictionary *info, EMError *error) {
//                               if (!error && info) {
//                                   NSLog(@"退出成功");
//                               }
//                           } onQueue:nil];
//                           [MBProgressHUD showSuccess:@"退出成功"];
//                           [self logoutSucc];
//                       } else {
//                           [MBProgressHUD showError:@"退出出现异常"];
//                       }
//                   }
//                   failure:^(NSURLSessionDataTask *task, NSError *error) {
//                       [MBProgressHUD hideHUD];
//                       //                       [MBProgressHUD showError:@"由于网络原因，退出失败"];
//                       [self logoutSucc];
//                   }];
//}
//
//- (void)logoutSucc {
//    [CHUserDefaults saveToken:nil];
//    [CHUserDefaults setIsAutoLogin:false];
//    ((CHAppDelegate *)[UIApplication sharedApplication].delegate).isTimerStart = false;
//    if(((CHAppDelegate *)[UIApplication sharedApplication].delegate).isLoginPageExist) {
//        [self dismissViewControllerAnimated:NO completion:nil];
//    } else {
//        ((CHAppDelegate *)[UIApplication sharedApplication].delegate).isLoginPageExist = true;
//        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Login&Register" bundle:nil];
//        [self presentViewController:[storyBoard instantiateInitialViewController] animated:YES completion:nil];
//    }
//}

@end
