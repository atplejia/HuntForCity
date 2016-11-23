//
//  ViewController.m
//  自定义登录界面
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "LoginViewController.h"
#import "LYTextField.h"
#import "LYButton.h"
#import "QJLTabBarController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(instancetype)init{
    if(self = [super init]){
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer addSublayer: [self backgroundLayer]];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self setUp];
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}
-(void)setUp{
    
    
    UIImageView *loginimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    loginimage.image = [UIImage imageNamed:@"Profileimage.png"];
    loginimage.center = CGPointMake(self.view.center.x, 150);
    loginimage.layer.masksToBounds=YES;
    loginimage.layer.cornerRadius=75;
    [self.view addSubview:loginimage];
    
    
    
    UIButton *detailBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    detailBtn.center = CGPointMake(self.view.center.x,630);
    [detailBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [detailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    detailBtn.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [detailBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:detailBtn];
    
    LYTextField *username = [[LYTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    username.center = CGPointMake(self.view.center.x, 350);
    username.ly_placeholder = @"用户名";
    username.tag = 0;
    [self.view addSubview:username];
    
    LYTextField *password = [[LYTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    password.center = CGPointMake(self.view.center.x, username.center.y+60);
    password.ly_placeholder = @"密码";
    password.tag = 1;
    [self.view addSubview:password];
    
    LYButton *login = [[LYButton alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    login.center = CGPointMake(self.view.center.x, password.center.y+100);
    [self.view addSubview:login];
    
    __block LYButton *button = login;
    
    login.translateBlock = ^{
        button.bounds = CGRectMake(0, 0, 44, 44);
        button.layer.cornerRadius = 22;
        
        QJLTabBarController *tabbar = [[QJLTabBarController alloc]init];
        [self presentViewController:tabbar animated:YES completion:nil];
    };
}

/*这是一个背景颜色封装,上半部分和下半部分是分开来*/
-(CAGradientLayer *)backgroundLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:26/255.0 green:198/255.0 blue:180/255.0 alpha:1.0].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.locations = @[@0.65,@1];
    return gradientLayer;
}
-(void)clickBtn{
    NSLog(@"忘记密码");
}
@end
