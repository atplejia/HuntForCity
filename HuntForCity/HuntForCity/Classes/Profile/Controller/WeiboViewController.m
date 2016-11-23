//
//  WeiboViewController.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/11/2.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "WeiboViewController.h"
#import "PrefixHeader.h"
@interface WeiboViewController ()
{
    UIWebView *webView;
}

@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Nav];
    
    [self weiboView];

    // Do any additional setup after loading the view.
}

-(void)Nav{
    //创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 66)];
    //把导航栏集合添加到导航栏中，设置动画关闭，设置颜色
    [navBar pushNavigationItem:[self navItem] animated:NO];
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:26/255.0 green:198/255.0 blue:180/255.0 alpha:1.0]];
    [self.view addSubview:navBar];
}

-(UINavigationItem *)navItem{
    // 创建一个导航项
    UINavigationItem *navigationItem = [[UINavigationItem alloc]
                                        initWithTitle:@"我的微博"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 创建一个左边边按钮
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,44,22)];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(weiboback)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    [navigationItem setLeftBarButtonItem:leftItem];
    
    return navigationItem;
}
-(void)weiboView{
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 66, AppWidth, AppHeight-66)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weibo.com/u/5500516766?is_all=1"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
    
}

-(void)weiboback
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
