//
//  RunPageController.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RunPageControllerDelegate <NSObject>

-(void)OnButtonClick;

@end

@interface RunPageController : UIView

@property id<RunPageControllerDelegate>delegate;

@end
