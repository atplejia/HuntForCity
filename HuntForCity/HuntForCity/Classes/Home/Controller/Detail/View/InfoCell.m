//
//  InfoCell.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "InfoCell.h"

@interface InfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleSecondLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleOneLabel;
@end

@implementation InfoCell

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


+ (instancetype)infoCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"infoCell";
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setModel:(InfoModel *)model
{
    _model = model;
    
    self.titleOneLabel.text = model.title;
    if (model.subTitle) {
        self.titleSecondLabel.text = model.subTitle;
    } else {
        self.titleSecondLabel.hidden = YES;
    }
    
    self.corImageView.hidden = !model.isShowImage;
    
    [self layoutIfNeeded];
    
    if (!self.titleSecondLabel.hidden) {
        model.cellHeight = CGRectGetMaxY(self.titleSecondLabel.frame) + 20;
    } else {
        model.cellHeight = CGRectGetMaxY(self.titleOneLabel.frame) + 10;
    }
    
}


@end
