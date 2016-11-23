//
//  RmndCell.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"

@interface RmndCell : UITableViewCell

/** cell的模型 */
@property (nonatomic, strong) HomeCellModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView model:(HomeCellModel *)model;


@end
