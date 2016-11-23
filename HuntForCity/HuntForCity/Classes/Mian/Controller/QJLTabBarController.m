//
//  QJLTabBarController.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLTabBarController.h"
#import "HomeViewController.h"
#import "FoundViewController.h"
#import "MoreViewController.h"
#import "ProfileViewController.h"

@interface QJLTabBarController ()

@end

@implementation QJLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self setUpChildVC];
    
}

- (void)setUpChildVC{
    
    /** 添加子控制器 */
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"home" selectedImage:@"homeSeletced"];
    
    [self setupChildVc:[[FoundViewController alloc] init] title:@"发现" image:@"found" selectedImage:@"foundSeletced" ];
    
    [self setupChildVc:[[MoreViewController alloc] init] title:@"更多" image:@"more" selectedImage:@"moreSeletced"];
    
    [self setupChildVc:[[ProfileViewController alloc] init] title:@"我" image:@"me" selectedImage:@"meSeletced"];

}

/* 初始化子控制器 **/
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 添加为子控制器
    [self addChildViewController:vc];
    //     取消选中时的背景色
    vc.tabBarItem.selectedImage = [vc.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
