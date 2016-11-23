//
//  HomeViewController.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ChooseCityController.h"
#import "PrefixHeader.h"

@interface HomeViewController ()<ChooseCityDelegate>{
    UIButton *chooseCityBtn;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化UI
    [self setUI];
    //导航栏
    [self Nav];
    
    [self CitySelect];
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
                                        initWithTitle:@"首页"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // 创建一个右边按钮
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,22,22)];
    [rightButton setImage:[UIImage imageNamed:@"search_icon_white_6P@2x"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButton)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    [navigationItem setRightBarButtonItem:rightItem];
    
    // 创建一个左边边按钮
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,22,22)];
    [leftButton addTarget:self action:@selector(CitySelect)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    [navigationItem setLeftBarButtonItem:leftItem];
    
   
    return navigationItem;
}

-(void)CitySelect{

    chooseCityBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 25, 80, 40)];
    [chooseCityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseCityBtn setTitle:@"选择城市" forState:UIControlStateNormal];
    [chooseCityBtn addTarget:self action:@selector(onClickChooseCity:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseCityBtn];

}


- (void)setUI
{
    //不需要系统自动处理顶部内容伸缩
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置tableView的背景色
    self.tableView.backgroundColor = Color(51, 52, 53);
    
    //设置tableView的frame把系统
    self.tableView.frame = CGRectMake(0, 64, AppWidth, AppHeight - 100);
    
    CGRect cRect = self.conditionView.frame;
    cRect.origin.y = cRect.origin.y + 64;
    self.conditionView.frame = cRect;
}



//推出search控制器
- (void)rightButton
{
    //方法一：直接Model跳转
    SearchViewController *search = [[SearchViewController alloc] init];
    [self presentModalViewController:search animated:YES];
  
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onClickChooseCity:(id)sender {
    
    ChooseCityController *cityPickerVC = [[ChooseCityController alloc] init];
    [cityPickerVC setDelegate:self];

    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        
    }];
}

#pragma mark - CityPickerDelegate
- (void) cityPickerController:(ChooseCityController *)chooseCityController didSelectCity:(City *)city
{
    [chooseCityBtn setTitle:city.cityName forState:UIControlStateNormal];
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(ChooseCityController *)chooseCityController
{
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
