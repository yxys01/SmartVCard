//
//  SCTabBarController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCTabBarController.h"
#import "TabBarView.h"
#import "Common.h"
#import "SCUserDefaults.h"
#import "SCAnimatedTransitioning.h"
#import "SCVisualEffectView.h"
#import "MKButton.h"
#import "SCMyCardDesignCollectionViewController.h"
#import "SCMyCardDesignViewLayout.h"
#import "SCCustomDesignTableViewController.h"
@interface SCTabBarController ()<tabBarViewDelegate,UINavigationBarDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) TabBarView *tabBarView;
@property (strong, nonatomic) NSDate *lastPlaySoundDate;

@end
@implementation SCTabBarController

static NSString *kMessageType = @"MessageType";
static NSString *kConversationChatter = @"ConversationChatter";


- (void)viewDidLoad {
    [super viewDidLoad];
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    [nc addObserver:self
//           selector:@selector(notificationChanged:)
//               name:NOTIFICATION_NOTIFICATION_CHANGED
//             object:nil];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    _tabBarView = [[TabBarView alloc] initWithFrame:CGRectMake(0, 0, Screenwidth, TABBAR_HEIGHT)];
    _tabBarView.delegate = self;
    _tabBarView.backgroundColor = COLOR_STYLE_WHITE;//[UIColor colorWithWhite:0.900 alpha:1.000];
    _tabBarView.opaque = YES;
    [_tabBarView addButtonWithImage:@"btn_p_card"  HImage:@"btn_d_card"];
    //    [_tabBarView addButtonWithImage:@"btn_d_talk" HImage:@"btn_p_talk"];
    [_tabBarView addButtonWithImage:@"btn_d_contact" HImage:@"btn_p_contact"];
    [_tabBarView addButtonWithImage:@"btn_d_receive_send" HImage:@"btn_p_send_receive"];
    [_tabBarView addButtonWithImage:@"btn_d_me" HImage:@"btn_p_me"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tabBar addSubview:_tabBarView];
    
    self.tabBar.frame = CGRectMake(0, ScreenHeight - TABBAR_HEIGHT, Screenwidth, TABBAR_HEIGHT);
    _tabBarView.frame = self.tabBar.bounds;
    
    if([SCUserDefaults getBackFromCircle]) {
        [SCUserDefaults setBackFromCircle:false];
        [self.tabBarView buttonClicked:2];
    }
    if ([SCUserDefaults getBackFromMyOrders]) {
        [SCUserDefaults setBackFromMyOrders:false];
        [self.tabBarView buttonClicked:1];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self refreshNotification];
}

/**获得当前的viewController，绑定to button？其实不太懂这个意义是什么？*/
- (BOOL)tabBarView:(TabBarView *)tabBarView ClickButtonFrom:(MKButton *)fromm To:(MKButton *)to {
    self.selectedIndex = to.tag;
    return true;
}

- (void)tabBarView:(TabBarView *)tabBarView centerButtonDidClick:(UIButton *)centerButton {
    SCVisualEffectView *view = [[SCVisualEffectView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    self.transitioningDelegate = self;
    __weak typeof(SCTabBarController *) wSelf = self;
    [view selectedlife:^(SCVisualEffectButton *btn) {
        
        SCMyCardDesignViewLayout *layout = [[SCMyCardDesignViewLayout alloc]initWithAnim:HJCarouselAnimLinear];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(250, 250);
        
        SCMyCardDesignCollectionViewController  *vc = [[SCMyCardDesignCollectionViewController alloc]initWithCollectionViewLayout:layout];
        

        vc.effectView = view;
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [wSelf presentViewController:nav animated:YES completion:nil];

    }];
//
    [view selectedPic:^(SCVisualEffectButton *btn) {

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ModelGeneration" bundle:nil];
        SCCustomDesignTableViewController *vc =[storyboard instantiateInitialViewController] ;
        vc.effectView = view;
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [wSelf presentViewController:nav animated:YES completion:nil];        
    }];
}


#pragma mark transitionAnimator delegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    NSLog(@"presented！！");
    return [[SCAnimatedTransitioning alloc] init];
}

//-(void)registerNotifications
//{
//    [self unregisterNotifications];
//
//    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
//    [[EaseMob sharedInstance].callManager addDelegate:self delegateQueue:nil];
//}
//
//-(void)unregisterNotifications
//{
//    [[EaseMob sharedInstance].chatManager removeDelegate:self];
//    [[EaseMob sharedInstance].callManager removeDelegate:self];
//}

//- (void)dealloc
//{
//    [self unregisterNotifications];
//}

//- (void)notificationChanged:(NSNotification*)notification {
//    [self refreshNotification];
//}
///**如果有新通知，显示出来；若无，则不显示*/
//- (void)refreshNotification {
//    if([SCUserDefaults getHasNewNotification]) {
//        [_tabBarView showBadgeAtIndex:3];
//        NSLog(@"[CHTabbar show red point]");
//    } else {
//        [_tabBarView hideBadgeAtIndex:3];
//        NSLog(@"[CHTabbar hide red point]");
//    }
//}

@end
