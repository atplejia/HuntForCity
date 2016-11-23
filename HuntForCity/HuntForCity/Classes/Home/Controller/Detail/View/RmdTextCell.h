//
//  RmdTextCell.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RmdCellModel;

@interface RmdTextCell : UITableViewCell

@property (nonatomic, strong) RmdCellModel *model;

+ (instancetype)cellWithTabelView:(UITableView *)tableView rmdCellModel:(RmdCellModel *)rmdCellMode;;

@end
