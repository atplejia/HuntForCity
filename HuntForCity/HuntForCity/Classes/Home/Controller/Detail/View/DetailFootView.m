//
//  DetailFootView.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DetailFootView.h"
#import "PrefixHeader.h"
#import "MenuButton.h"

@interface DetailFootView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, weak) MenuButton *collectButton1;
@property (nonatomic, weak) MenuButton *collectButton2;
@property (nonatomic, weak) MenuButton *collectButton3;
@property (nonatomic, weak) MenuButton *collectButton4;
@property (nonatomic, weak) MenuButton *collectButton5;
@property (nonatomic, weak) MenuButton *collectButton6;

@end

@implementation DetailFootView


- (void)awakeFromNib
{
    self.collectButton1 = [self createButtonWithTag:0];
    self.collectButton2 = [self createButtonWithTag:1];
    self.collectButton3 = [self createButtonWithTag:2];
    self.collectButton4 = [self createButtonWithTag:3];
    self.collectButton5 = [self createButtonWithTag:4];
    self.collectButton6 = [self createButtonWithTag:5];
    
    CGFloat W = AppWidth;
    CGFloat btnY = CGRectGetMaxY(self.titleLabel.frame) + 20;
    CGFloat btnW = 40;
    CGFloat btnH = 40;
    CGFloat margin = (W - 6 * btnW) / 7;
    
    self.collectButton1.frame = CGRectMake(margin, btnY, btnW, btnH);
    self.collectButton2.frame = CGRectMake(margin + (margin + btnW), btnY, btnW, btnH);
    self.collectButton3.frame = CGRectMake(margin + (margin + btnW) * 2, btnY, btnW, btnH);
    self.collectButton4.frame = CGRectMake(margin + (margin + btnW) * 3, btnY, btnW, btnH);
    self.collectButton5.frame = CGRectMake(margin + (margin + btnW) * 4, btnY, btnW, btnH);
    self.collectButton6.frame = CGRectMake(margin + (margin + btnW) * 5, btnY, btnW, btnH);
    
}

- (MenuButton *)createButtonWithTag:(NSInteger)tag;
{
    MenuButton *btn = [MenuButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 20;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    if (tag != 5) {
        [btn setBackgroundImage:[UIImage imageNamed:@"myicon"] forState:UIControlStateNormal];
    } else {
        [btn setBackgroundColor:GolbalGreen];
        [btn setTitle:@"22" forState:UIControlStateNormal];
    }
    [self addSubview:btn];
    
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

+ (instancetype)detailFootView
{
    DetailFootView *footView = [[NSBundle mainBundle] loadNibNamed:@"DetailFootView" owner:nil options:nil].firstObject;
    
    return footView;
}



- (void)btnClick:(MenuButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(detailFootViewDidClick:index:)]) {
        [self.delegate detailFootViewDidClick:self index:sender.tag];
    }
}


@end
