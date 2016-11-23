//
//  BlurCell.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BlurCell.h"


@interface BlurCell ()

/** 图片 */
@property (weak, nonatomic) IBOutlet UIButton *blurImageView;

/* 文字 */
@property (weak, nonatomic) IBOutlet UILabel *blurTitleLabel;

@end

@implementation BlurCell

+ (instancetype)blurCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath
{
    BlurCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"blurCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)setModel:(FoundCellModel *)model
{
    _model = model;
    
    [self.blurImageView setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    [self.blurTitleLabel setText:model.title];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    /*  拦截事件响应者，不论触发了cell中的哪个控件都交给cell来响应 */
    // 1.判断当前控件能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    
    // 2. 判断点在不在当前控件
    if ([self pointInside:point withEvent:event] == NO) return nil;
    
    return self;
}

@end
