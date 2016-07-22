//
//  SCUserHelpListController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/19.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCUserHelpListController.h"
#import "Common.h"
#import "SCUserHelpCell.h"

@interface SCUserHelpListController ()

@property (nonatomic, strong) NSArray *contents;


@end

@implementation SCUserHelpListController

static NSString *CellIdentifier = @"UserHelpCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
- (NSArray *)contents
{
    if (!_contents) {
        _contents = @[
                      @[
                          @"1.为什么我不能同意别人给我发的邀请加入家庭？",
                          @"A:一个用户只能加入一个家庭，家庭成员想加入其它家庭必须退出现有家庭。"],
                      @[
                          @"2.金币领取规则？",
                          @"A:每人每天能领取50金币，金币计入家庭资产和个人贡献，用户退出家庭后家庭资产不变，个人贡献清零。"
                          ],
                      @[
                          @"3.户主专享权利是哪些？",
                          @"A:邀请成员、移除成员、解散家庭、修改家庭信息、批量删除照片等。"
                          ],
                      @[
                          @"4.不能查看到家人的位置？",
                          @"A:家人可能未启动程序或选择了“隐身模式”上传位置。"
                          ],
                      @[
                          @"5.我为什么不能上传照片？",
                          @"A:照片墙最多只能上传18张照片，超过则不能继续上传。"
                          ],
                      @[
                          @"6.我为什么不能删除照片？",
                          @"A:普通成员只能删除自己上传的照片，户主才能删除其他人上传的照片。"
                          ],
                      @[
                          @"7.“添加设备”是什么意思？",
                          @"A:用户可以绑定长虹关爱系列功能手机，这样就能在“在哪儿”页面中查看功能机的位置及信息。"
                          ],
                      @[
                          @"8.我可以不加入家庭么？",
                          @"A:可以，但是不加入家庭，就只能使用在哪儿功能，可以查看自己的位置和足迹！"
                          ],
                      @[
                          @"9.何为户主？",
                          @"A:户主为家庭创建人，享有更多权限。"
                          ],
                      @[
                          @"10.为什么足迹里面有去过的地方没有显示出来？",
                          @"A:请确保网络畅通，足迹是通过位置来确定，如果网络不好时无法定位，就不能获取位置信息。"
                          ]
                      ];
    }
    
    return _contents;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SCUserHelpCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[SCUserHelpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    [self configureBasicCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForBasicCellAtIndexPath:indexPath];
}

- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {
    static SCUserHelpCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    });
    
    [self configureBasicCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}
/**设置间隔cell背景颜色*/
- (void)configureBasicCell:(SCUserHelpCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [cell.userHelpLabel setText:self.contents[indexPath.section][indexPath.row]];
    if(indexPath.row%2==0) {
        [cell setBackgroundColor:COLOR_STYLE_BACK];
    } else {
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
}
/**计算cell的高度*/
- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(sizingCell.bounds));
    NSLog(@"CGRectGetWidth(self.tableView.frame) %f, %f", CGRectGetWidth(self.tableView.frame), CGRectGetHeight(sizingCell.bounds));
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1;
}


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

@end
