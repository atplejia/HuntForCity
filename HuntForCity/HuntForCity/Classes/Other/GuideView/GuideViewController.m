//
//  GuideViewController.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "GuideViewController.h"
#import "RunPageController.h"
#import "LoginViewController.h"
@interface GuideViewController ()<RunPageControllerDelegate>

@property RunPageController *RunPageControllerView;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.RunPageControllerView = [[RunPageController alloc] initWithFrame:self.view.frame];
    self.RunPageControllerView.delegate = self;
    [self.view addSubview:self.RunPageControllerView];
}
#pragma mark -- RunPageControllerDelegate
-(void)OnButtonClick{
    LoginViewController *login = [[LoginViewController alloc] init];
    [self presentModalViewController:login animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
