//
//  headView.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "headView.h"

@implementation headView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self creatHeadView];
    }
    return self;
}
-(void)creatHeadView
{
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 29)];
    self.imageV.image = [UIImage imageNamed:@"bg_profile_passport_blue@2x"];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 29)];
    self.titleLabel.font=[UIFont systemFontOfSize:18];
    self.titleLabel.textColor=[UIColor blackColor];
    //self.titleLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"zu"]];
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.imageV];
}
@end
