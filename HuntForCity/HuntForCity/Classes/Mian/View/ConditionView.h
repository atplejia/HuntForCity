//
//  ConditionView.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuButton, ConditionView;

//选择查询按钮类型
typedef NS_ENUM(NSInteger, ConditionButtonType) {
    ConditionButtonTypeClassify = 10,
    ConditionButtonTypeArea = 11,
    ConditionButtonTypeSort = 12,
    ConditionButtonTypeMap = 13,
    ConditionButtonTypeList = 14
};

@protocol ConditionViewDelegate <NSObject>

@optional

//代理方法，按钮点击出发
/** 点击前三个按钮触发代理事件 */
- (void)conditionView:(ConditionView *)view didButtonClickFrom:(ConditionButtonType)from to:(ConditionButtonType)to;

/** 点击了地图按钮，显示地图 */
- (void)conditionViewdidSelectedMap:(ConditionView *)view;

/** 点击了列表按钮 移除地图View */
- (void)conditionViewdidSelectedList:(ConditionView *)view;

/** 取消选择按钮 */
- (void)conditionViewCancelSelectButton:(ConditionView *)view;

@end

@interface ConditionView : UIView

@property (nonatomic, weak) id <ConditionViewDelegate> delegate;

/**
 *  取消所有按钮的选中状态
 */
- (void)cancelSelectedAllButton;

@end
