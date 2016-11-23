//
//  DetailFootView.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailFootView;

@protocol DetailFootViewDelegate <NSObject>

@optional
//点击事件
- (void)detailFootViewDidClick:(DetailFootView *)footView index:(NSInteger)index;

@end

@interface DetailFootView : UIView

@property(nonatomic, assign) id <DetailFootViewDelegate> delegate;

+ (instancetype)detailFootView;//应该传入模型的

@end
