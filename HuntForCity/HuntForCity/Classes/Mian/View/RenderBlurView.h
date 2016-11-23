//
//  RenderBlurView.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RenderBlurView;
@protocol RenderBlurViewDelegate <NSObject>
- (void)renderBlurView:(RenderBlurView *)view didSelectedCellWithTitle:(NSString *)title;
- (void)renderBlurViewCancelBtnClick:(RenderBlurView *)view;

@end

@interface RenderBlurView : UIImageView

+ (instancetype)renderBlurViewWithImage:(UIImage *)image;

@property (nonatomic, weak) id <RenderBlurViewDelegate> delegate;

- (void)hideBlurView;

@end
