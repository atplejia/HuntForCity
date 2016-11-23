//
//  DetailRnmdTableHeadView.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DetailRnmdTableHeadView.h"
#import "PrefixHeader.h"
#import "UserInfoDetailViewController.h"

@interface DetailRnmdTableHeadView ()

//作者头像
@property (weak, nonatomic) IBOutlet UIImageView *authorIconImageView;
//作者名子
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;
//浏览人数
@property (weak, nonatomic) IBOutlet UILabel *browseCountLabel;

//推荐tableView的titleLabel
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@end

@implementation DetailRnmdTableHeadView

- (void)awakeFromNib
{
    //设置作者名字的颜色
    self.authorNameLabel.textColor = GolbalGreen;
    //设置头像羽化半径
    self.authorIconImageView.layer.masksToBounds = YES;
    self.authorIconImageView.layer.cornerRadius = self.authorIconImageView.bounds.size.width * 0.5;
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self addGestureRecognizer:tap];
}

+ (instancetype)detailRnmdTableHeadView
{
    DetailRnmdTableHeadView *view = [[[NSBundle mainBundle] loadNibNamed:@"DetailRnmdTableHeadView" owner:nil options:nil] lastObject];
    
    return view;
}

- (void)viewClick
{
    //拿到当前的控制器,这个view在正常的时候会在创建后拿到数据模型，所以可以直接推到下一个界面，展示作者的详情
    
    UserInfoDetailViewController *user = [[UserInfoDetailViewController alloc] init];
    
    [self.superNC pushViewController:user animated:YES];
    
    
}

@end
