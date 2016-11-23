//
//  SelectView.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectView;

@protocol SelectViewDelegate <NSObject>

@optional
//当按钮点击时通知代理
- (void)selectView:(SelectView *)selectView didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

- (void)selectView:(SelectView *)selectView didChangeSelectedView:(NSInteger)to;

@end

@interface SelectView : UIView

/** 用来确定是否显示评论列表的 默认是NO，只显示俩个button, 如果是YES就显示3个button */
@property(nonatomic, assign) BOOL isShowComment;

@property(nonatomic, weak) id <SelectViewDelegate> delegate;

+ (instancetype)selectViewWithisShowComment:(BOOL)isShowComment;

//提供给外部一个可以滑动底部line的方法
- (void)lineToIndex:(NSInteger)index;

@end
