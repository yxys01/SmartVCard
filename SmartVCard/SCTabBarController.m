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
//    __weak typeof(SCTabBarController *) wSelf = self;
//    [view selectedlife:^(SCVisualEffectButton *btn) {
//                CHCircleAddViewController *vc = [[CHCircleAddViewController alloc] initWithNibName:@"CHCircleAddViewController" bundle:nil];
//                vc.effectView = view;
//                CHNaviController *navigationController = [[CHNaviController alloc] initWithRootViewController:vc];
//                [wSelf presentViewController:navigationController animated:YES completion:NULL];
//        
//        UINavigationController *nav = [[UIStoryboard storyboardWithName:@"FamilyCircleAdd" bundle:nil] instantiateInitialViewController];
//        
//        CHCircleAddViewController *vc = nav.viewControllers[0];
//        vc.effectView = view;
//        UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:0.439 green:0.824 blue:0.820 alpha:0.899] andSize:(CGSize){5,44}];
//        [nav.navigationBar setBackgroundImage:[UIImage resizedImage:image] forBarMetrics:(UIBarMetricsDefault)];
//        nav.transitioningDelegate = wSelf;
//        [wSelf presentViewController:nav animated:YES completion:nil];
//    }];
//    
//    [view selectedPic:^(SCVisualEffectButton *btn) {
//        CHPicUploadEditController *vc = [[CHPicUploadEditController alloc] init];
//        //vc.effectView = view;
//        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
//        //UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:0.961 green:0.647 blue:0.000 alpha:0.899] andSize:(CGSize){5,44}];
//        //[navi.navigationBar setBackgroundImage:[UIImage resizedImage:image] forBarMetrics:(UIBarMetricsDefault)];
//        //navi.transitioningDelegate = wSelf;
//        [self presentViewController:navi animated:YES completion:nil];//视图切换
//    }];
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
