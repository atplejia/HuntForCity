//
//  DistinationHeadView.h
//  HuntForCity
//
//  Created by 金亮齐 on 2016/11/2.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DistinationHeadViewDelegate <NSObject>

-(void)sendButton:(UIButton *)button;

@end
@interface DistinationHeadView : UICollectionReusableView
@property(nonatomic,strong)id<DistinationHeadViewDelegate>delegate;
@property(nonatomic,strong)UIButton *button;
@end
