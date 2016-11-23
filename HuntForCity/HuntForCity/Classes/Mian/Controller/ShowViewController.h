//
//  ShowViewController.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConditionView.h"
#import "RenderBlurView.h"
#import "MapViewController.h"

@interface ShowViewController : UIViewController

/** 显示的tableView */
@property (nonatomic, strong) UITableView *tableView;

/** 顶部的选着条件按钮的View */
@property (nonatomic, strong) ConditionView *conditionView;

/** 用来放当前模糊的imageView */
@property (nonatomic, strong) RenderBlurView *blurImageView;

/** 地图的控制器 */
@property (nonatomic, strong) MapViewController *mapVC;


@end
