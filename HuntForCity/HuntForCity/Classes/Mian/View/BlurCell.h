//
//  BlurCell.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoundCellModel.h"

@interface BlurCell : UICollectionViewCell

/** 直接用found的模型 */
@property (nonatomic, strong) FoundCellModel *model;

+ (instancetype)blurCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
