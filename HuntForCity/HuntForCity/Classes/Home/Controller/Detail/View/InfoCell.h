//
//  InfoCell.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoModel.h"

@interface InfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *corImageView;

@property (weak, nonatomic) IBOutlet UIView *lineView;

/** 数据模型 */
@property (nonatomic, strong) InfoModel *model;

+ (instancetype)infoCellWithTableView:(UITableView *)tableView;


@end
