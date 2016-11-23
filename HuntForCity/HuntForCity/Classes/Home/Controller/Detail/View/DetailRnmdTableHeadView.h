//
//  DetailRnmdTableHeadView.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailRnmdTableHeadView : UIView

/** 临时记录自己的导航控制器 ￥￥￥注意这儿必须用weak,如果用strong就循环引用了￥￥￥￥ */
@property (weak, nonatomic) UINavigationController *superNC;

+ (instancetype)detailRnmdTableHeadView;

@end
