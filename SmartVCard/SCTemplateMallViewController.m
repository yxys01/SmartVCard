//
//  SCTemplateMallViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/5.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCTemplateMallViewController.h"
#import "SCTemplateMallBannerCell.h"
#import "SCTemplateMallSearchCell.h"
#import "SCTemplateMallDisplayCell.h"
#import "SCTemplateMallSearchBarView.h"
#import "SCTemplateMallModel.h"
#import "UIViewController+SQExtension.h"
#import "CAAnimation+SQExtension.h"
#import "CALayer+SQExtension.h"
#import "SCTemplateMallDownloadViewController.h"
#import "SQMacro.h"
#import "SCTemplateMallButton.h"


@interface SCTemplateMallViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray * keysArr;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) SCTemplateMallSearchBarView * titleView;
@property (nonatomic,strong) SCTemplateMallSearchBarView * searchBarView;
@property (nonatomic,strong) SCTemplateMallButton * postButton;

@end

@implementation SCTemplateMallViewController

- (void)loadView {
    [super loadView];
    [self.navigationItem setTitleView:self.titleView];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchBarView removeFromSuperview];
    [self.postButton removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self scrollViewDidScroll:self.tableView];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController.view addSubview:self.searchBarView];
    [self.navigationController.view addSubview:self.postButton];
    [self.searchBarView loomingAnimationWithDuration:kTimeInterval];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat searchBarViewX = kSpace;
    CGFloat searchBarViewW = self.titleView.width;
    CGFloat searchBarViewH = self.titleView.height;
    CGFloat searchBarViewY = kScaleLength(210) + searchBarViewH - self.tableView.contentOffset.y - searchBarViewH;
    self.searchBarView.frame = CGRectMake(searchBarViewX, searchBarViewY, searchBarViewW, searchBarViewH);
}

- (NSArray *)keysArr {
    
    if (!_keysArr) {
        _keysArr = @[kSCTemplateMallBannerKey,
                     kSCTemplateMallSearchKey];
    }
    return _keysArr;
}

- (SCTemplateMallSearchBarView *)titleView {
    
    if (!_titleView) {
        _titleView = [SCTemplateMallSearchBarView new];
        _titleView.frame = self.navigationController.navigationBar.frame;
    }
    return _titleView;
}

- (SCTemplateMallSearchBarView *)searchBarView {
    
    if (!_searchBarView) {
        _searchBarView = [SCTemplateMallSearchBarView new];
    }
    return _searchBarView;
}

- (SCTemplateMallButton *)postButton {
    
    CGFloat postButtonW = 40;
    CGFloat postButtonH = postButtonW;
    CGFloat postButtonX = self.view.width - kSpace - postButtonW;
    CGFloat postButtonY = self.view.height - 49 - kSpace - postButtonH;
    
    if (!_postButton) {
        _postButton = [SCTemplateMallButton new];
        _postButton.frame = CGRectMake(postButtonX, postButtonY, postButtonW, postButtonH);
    }
    [CAAnimation animationPopWithLayer:_postButton.layer];
    return _postButton;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.frame = self.view.bounds;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = GLOBAL_BGC;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!section) {
        return self.keysArr.count;
    }
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!indexPath.section) {
        NSString * const key = self.keysArr[indexPath.row];
        if (key == kSCTemplateMallBannerKey) {
            SCTemplateMallBannerCell * cell = [SCTemplateMallBannerCell cellWithTableView:tableView];
            return cell;
        }
        if (key == kSCTemplateMallSearchKey) {
            SCTemplateMallSearchCell * cell = [SCTemplateMallSearchCell cellWithTableView:tableView];
            return cell;
        }
    }
    SCTemplateMallDisplayCell * cell = [SCTemplateMallDisplayCell cellWithTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!indexPath.section) {
        NSString * const key = self.keysArr[indexPath.row];
        if (key == kSCTemplateMallBannerKey) {
            return [SCTemplateMallBannerCell cellHeight];
        }
        if (key == kSCTemplateMallSearchKey) {
            return [SCTemplateMallSearchCell cellHeight];
        }
    }
    return [SCTemplateMallDisplayCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[SCTemplateMallDownloadViewController new] animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self navigationBarGradualChangeWithScrollView:scrollView titleView:self.titleView movableView:self.searchBarView offset:kScaleLength(190.5) color:[UIColor colorWithWhite:1.000 alpha:0.000]];
}


@end
