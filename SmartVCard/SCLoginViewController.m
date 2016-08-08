//
//  SCLoginViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/26.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCLoginViewController.h"
#import "Define.h"
#import "SCTabBarController.h"


@interface SCLoginViewController () <LoginRegisterDelegate>
@property(nonatomic,strong)LoginView *loginR;
@end

@implementation SCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.view.layer.cornerRadius = 40;

#warning 1. 创建登录注册页面
    // 登录注册类调用
    self.loginR = [[LoginView alloc] initWithFrame:self.view.frame];
#warning 2. 签代理 代理方法可以拿到登录信息和注册信息
    _loginR.delegate = self;
    [self.view addSubview:_loginR];
    

}

#pragma mark - LoginView delegate
#warning 3. 根据不同的后台给的字段 代表的意思 以及值进行不同处理
-(void)getLoginName:(NSString *)name pass:(NSString *)pass
{
    //调用登录验证接口(这里用get网络请求的方式，和post网络请求的方式)
    NSString *url = @"http://127.0.0.1/loginGet.php";
    //后台规定登录用户名的字段必须是name密码的pass
    NSDictionary *dic = @{@"name":name,@"pass":pass};
    //网络请求
    [LDXNetWork GetThePHPWithURL:url par:dic success:^(id responseObject) {
        //后台返回的字典里 如果success对应的value是1代表登录成功
        if([responseObject[@"success"] isEqualToString:@"1"]){
            
//            SCLoginMainViewController *mainVC = [[SCLoginMainViewController alloc]init];
//            mainVC.dic = responseObject;

//            [self presentViewController:mainVC animated:YES completion:nil];

            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SCTabBarController *vc = [storyboard instantiateInitialViewController];
            [self presentViewController:vc animated:YES completion:nil];
        }else{
            [self showTheAlertView:self andAfterDissmiss:1.0 title:@"账号或密码错误" message:@""];
        }
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (void)getRegisterName:(NSString *)name pass:(NSString *)pass age:(NSString *)age telephone:(NSString *)telephone image:(UIImage *)image
{
    
    NSString *url = @"http://127.0.0.1/register.php";
    NSDictionary *dic = @{@"name2":name, @"pass2":pass, @"CName2":age, @"telephone2":telephone};
    // 网络请求有点特殊点进去看 (@"uploadimageFile" 后台给的字段)
    [LDXNetWork PostThePHPWithURL:url par:dic image:image uploadName:@"uploadimageFile" success:^(id response) {
        
        NSString *success = response[@"success"];
        if ([success isEqualToString:@"1"]) {
            // 代表注册成功
            [self showTheAlertView:self andAfterDissmiss:1.5 title:@"注册成功" message:@""];
            // 跳转回到登录界面
            [_loginR goToLoginView];
            
        }
        else if([success isEqualToString:@"-1"]){
            [self showTheAlertView:self andAfterDissmiss:1.5 title:@"账号已经被注册了" message:@""];
        }
        
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
