//
//  ScrollHeadView.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollHeadView : UIScrollView

//代替系统的导航条
@property (nonatomic, strong) UIView *naviView;


/**
 *  便利构造方法
 */
+ (instancetype)scrollHeadViewWithImages:(NSArray *)images;

/**
 *  scrollHeadView开始滚动，通知内部的pageView,和绿色的蒙版View更新位置
 *  因为这俩个控件和self是在同一个父控件中，所以需要通知这俩个对象来更新位置
 *
 *  @param rect   scrollHeadView的新frame
 *  @param height scrollHeadView的高度
 */
- (void)headViewDidScroll:(CGRect)rect headViewHeight:(CGFloat)height;

@end
