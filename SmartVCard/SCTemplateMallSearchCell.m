//
//  SCTemplateMallSearchCell.m
//  SmartVCard
//
//  Created by 夏天 on 16/8/5.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCTemplateMallSearchCell.h"
#import "SCTemplateMallSearchBarView.h"
#import "SQMacro.h"
@interface SCTemplateMallSearchCell ()

@property (nonatomic,strong) UIImageView * hotSpotsImageView;
@property (nonatomic,strong) SCTemplateMallSearchBarView * searchBarView;

@end

@implementation SCTemplateMallSearchCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    NSString * identifier = NSStringFromClass([SCTemplateMallSearchCell class]);
    SCTemplateMallSearchCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SCTemplateMallSearchCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.userInteractionEnabled = NO;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (UIImageView *)hotSpotsImageView {
    
    if (!_hotSpotsImageView) {
        _hotSpotsImageView = [UIImageView new];
        _hotSpotsImageView.image = [UIImage imageNamed:kLifestyle_hotspots];
    }
    return _hotSpotsImageView;
}

- (SCTemplateMallSearchBarView *)searchBarView {
    
    if (!_searchBarView) {
        _searchBarView = [SCTemplateMallSearchBarView new];
    }
    return _searchBarView;
}

- (void)setupSubviews {
    [self setBackgroundColor:GLOBAL_BGC];
    [self.contentView addSubview:self.hotSpotsImageView];
    [self.contentView addSubview:self.searchBarView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat padding = kSpace;
    
    CGFloat hotSpotsImageViewX = padding;
    CGFloat hotSpotsImageViewW = 90;
    CGFloat hotSpotsImageViewH = 20;
    CGFloat hotSpotsImageViewY = self.height - hotSpotsImageViewH - 5;
    self.hotSpotsImageView.frame = CGRectMake(hotSpotsImageViewX, hotSpotsImageViewY, hotSpotsImageViewW, hotSpotsImageViewH);
    
    CGFloat searchBarViewX = padding;
    CGFloat searchBarViewY = 0;
    CGFloat searchBarViewW = self.width - 2 * padding;
    CGFloat searchBarViewH = 34;
    self.searchBarView.frame = CGRectMake(searchBarViewX, searchBarViewY, searchBarViewW, searchBarViewH);
}

+ (CGFloat)cellHeight {
    return 75;
}


@end
