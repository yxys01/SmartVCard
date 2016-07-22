//
//  SCBehavior.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/12.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCBehavior : UIDynamicBehavior
/**重力特性*/
@property (strong, nonatomic) UIGravityBehavior* gravity;
@property (strong, nonatomic) UICollisionBehavior* collision;
/**捕捉行为*/
@property (strong, nonatomic) UISnapBehavior *snap;

@property (strong, nonatomic) UIDynamicItemBehavior* aniamtionOption;

- (void)addItem:(id<UIDynamicItem>)item;

- (void)removeItem:(id<UIDynamicItem>)item;

@end
