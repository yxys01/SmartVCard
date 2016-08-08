//
//  SCMyCardDesignCollectionViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/28.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCMyCardDesignCollectionViewController.h"
#import "SCMyCardDesignViewCell.h"
#import "SCMyCardDesignViewLayout.h"
#import "SCTabBarController.h"
@interface SCMyCardDesignCollectionViewController ()

@end

@implementation SCMyCardDesignCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;

    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SCMyCardDesignViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backMain:)];

}
-(void)loadView
{
    [super loadView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    return;
}


-(void)backMain:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSIndexPath *)curIndexPath{
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
    NSIndexPath *curIndexPath = nil;
    NSInteger curzIndex = 0;
    for (NSIndexPath *path in indexPaths.objectEnumerator) {
        UICollectionViewLayoutAttributes *attributes = [self.collectionView layoutAttributesForItemAtIndexPath:path];
        if (!curIndexPath) {
            curIndexPath = path;
            curzIndex = attributes.zIndex;
            continue;
        }
        if (attributes.zIndex > curzIndex) {
            curIndexPath = path;
            curzIndex = attributes.zIndex;
        }
    }
    return curIndexPath;
}
//返回这个UICollectionView是否可以被选择 
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *curIndexPath = [self curIndexPath];
    if (indexPath.row == curIndexPath.row) {
        return YES;
    }
    
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    

    return NO;
}
//UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"click %ld", indexPath.row);
}

#pragma mark <UICollectionViewDataSource>
//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SCMyCardDesignViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", indexPath.row % 3]];
    return cell;
}
@end
