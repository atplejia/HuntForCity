//
//  LYButton.h
//  自定义登录界面
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finishBlock)();

@interface LYButton : UIView

@property (nonatomic,copy) finishBlock translateBlock;

@end
