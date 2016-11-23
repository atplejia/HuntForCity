//
//  RunPageController.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "RunPageController.h"
#import "PrefixHeader.h"
@interface RunPageController()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *runScrollView;

@property UIButton *onButton;


@end
@implementation RunPageController

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.runScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        self.runScrollView.pagingEnabled = YES;
        self.runScrollView.contentSize = CGSizeMake(self.frame.size.width * 3, self.frame.size.height);
        [self addSubview:self.runScrollView];
      
        CGPoint scrollPoint = CGPointMake(0, 0);
        [self.runScrollView setContentOffset:scrollPoint animated:YES];
        //添加引导页
        [self creatOne];
        [self creatTwo];
        [self creatThree];
    }
    return self;
}
#pragma mark -- 点击进入
- (void)onButtonGO{
    [self.delegate OnButtonClick];
}
#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
#pragma mark -- 添加启动页
- (void)creatOne{
    UIImageView *imageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Guide1.png"]];
    imageView.frame = CGRectMake(0, 0, AppWidth, AppHeight);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.runScrollView.delegate = self;
    [self.runScrollView addSubview:imageView];
}
- (void)creatTwo{
    UIImageView *imageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Guide2.png"]];
    imageView.frame = CGRectMake(AppWidth, 0, AppWidth, AppHeight);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.runScrollView.delegate = self;
    [self.runScrollView addSubview:imageView];
}

- (void)creatThree{
    UIImageView *imageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Guide3.png"]];
    imageView.frame = CGRectMake(AppWidth * 2, 0, AppWidth, AppHeight);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.runScrollView.delegate = self;
    [self.runScrollView addSubview:imageView];
    
    self.onButton = [[UIButton alloc] initWithFrame:CGRectMake(AppWidth/2 -60 , AppHeight * 0.9, 140, 40)];
    [self.onButton setTitle:@"立即进入" forState:UIControlStateNormal];
    [self.onButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.onButton addTarget:self action:@selector(onButtonGO) forControlEvents:UIControlEventTouchUpInside];
    self.onButton.layer.cornerRadius = 24;
    self.onButton.backgroundColor = Color(26, 198, 180);
    imageView.userInteractionEnabled = YES;
    [imageView addSubview:self.onButton];
    
}



@end
