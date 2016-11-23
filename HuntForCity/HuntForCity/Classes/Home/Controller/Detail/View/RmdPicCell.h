//
//  RmdPicCell.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RmdCellModel.h"

@interface RmdPicCell : UITableViewCell

@property (nonatomic, strong) RmdCellModel *model;

+ (instancetype)cellWithTabelView:(UITableView *)tableView  rmdPicModel:(RmdCellModel *)model;

@end
