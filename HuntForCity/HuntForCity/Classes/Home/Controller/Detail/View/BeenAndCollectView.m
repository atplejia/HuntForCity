//
//  BeenAndCollectView.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BeenAndCollectView.h"
#import "MenuButton.h"
//#import "UnLoginView.h"

@interface BeenAndCollectView ()

@property (weak, nonatomic) IBOutlet MenuButton *beenButton;
@property (weak, nonatomic) IBOutlet MenuButton *collectButton;

@end


@implementation BeenAndCollectView

- (void)awakeFromNib
{
    [self.beenButton addTarget:self action:@selector(beenButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.collectButton addTarget:self action:@selector(collectButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

+ (instancetype)beenAndCollectView
{
    BeenAndCollectView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    
    return view;
}

- (void)beenButtonClick
{
    [self showPromptViewToView];
}

- (void)collectButtonClick
{
    [self showPromptViewToView];
}

- (void)showPromptViewToView
{
//    UnLoginView *unLogin = [UnLoginView unLoginView];
//    [unLogin showUnLoginViewToView:self.superview];
}


@end
