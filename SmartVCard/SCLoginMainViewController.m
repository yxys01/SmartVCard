//
//  SCLoginMainViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/26.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCLoginMainViewController.h"

@interface SCLoginMainViewController ()

@end

@implementation SCLoginMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    imageV.backgroundColor = [UIColor greenColor];
    
    //取出用户名对应的头部图片
    NSString *imagValue = self.dic[@"name"];
    
#warning 5. 直接在这里进行网址路径拼接, 因为不同用户要取不同的头像图片, 图片都保存在服务器的一个叫download2文件夹, 里面图片是根据用户名加.jpg来获取的
    NSString *url = [NSString stringWithFormat:@"%@%@.jpg",@"http://127.0.0.1/download2",imagValue];
    
    //同步加载图片
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:data];
    [imageV setImage:image];
    [self.view addSubview:imageV];
    
    //循环创建label，从请求下来传过来的字典里，拿出指定的字段的value值显示
    NSArray *arr = @[@"name",@"age",@"telephone"];
    for(int  i = 0;i < 3;i++){
        CGFloat offY = 320;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, offY + i*50, 250, 40)];
        [self.view addSubview:label];
        NSString *s = arr[i];
        NSString *value = self.dic[s];
        label.text = [NSString stringWithFormat:@"%@: %@",s,value];
    }
    
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
