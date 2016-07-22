//
//  SCBehavior.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/12.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCBehavior.h"

@implementation SCBehavior
- (UIGravityBehavior *)gravity{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.05;
    }
    return _gravity;
}

- (UICollisionBehavior *)collision{
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
        _collision.collisionMode = UICollisionBehaviorModeEverything;
    }
    return _collision;
}
//创建仿真器
- (UIDynamicItemBehavior *)aniamtionOption{
    if (!_aniamtionOption) {
        _aniamtionOption = [[UIDynamicItemBehavior alloc] init];
        _aniamtionOption.allowsRotation = NO;
        _aniamtionOption.friction = 0;
    }
    return _aniamtionOption;
}

- (void)addItem:(id<UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collision addItem:item];
    [self.aniamtionOption addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collision removeItem:item];
    [self.aniamtionOption removeItem:item];
}

- (instancetype)init
{
    self = [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collision];
    [self addChildBehavior:self.aniamtionOption];
    return self;
}
@end
