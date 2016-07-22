//
//  SCAnimatedTransitioning.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/12.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCAnimatedTransitioning.h"

@implementation SCAnimatedTransitioning
/** 系统给出一个切换上下文，我们根据上下文环境返回这个切换所需要的花费时间*/
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.45;
}
/**完成容器转场动画的主要方法，我们对于切换时的UIView的设置和动画都在这个方法中完成*/
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    NSLog(@"Hello1:%@",transitionContext);
    //可以看做为destination ViewController
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //可以看做为source ViewController
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //添加toview到容器上
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //fromViewController.view.transform = CGAffineTransformMakeScale(2,2);
        //动画效果；这里是一个右上的偏移
        toViewController.view.transform = CGAffineTransformMakeScale(1, 1);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        //声明过渡结束-->记住，一定别忘了在过渡结束调用completeTransition：这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
