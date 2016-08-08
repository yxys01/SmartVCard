//
//  SCTemplateMallDownloadViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/5.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCTemplateMallDownloadViewController.h"
#import "UIViewController+SQExtension.h"
#import "SQMacro.h"

@interface SCTemplateMallDownloadViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation SCTemplateMallDownloadViewController

- (void)loadView {
    [super loadView];
    [self setTitle:@"下载页面"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
//    [self setNavigationBarColor:KC01_57c2de alpha:1.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(Back)];
}

-(void)Back{
    [self.navigationController popViewControllerAnimated:YES];

}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.frame = self.view.bounds;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }   cell.textLabel.text = @"https://coderZsq.github.io";
    return cell;
}


@end
