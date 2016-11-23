//
//  RmdTextCell.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "RmdTextCell.h"
#import "RmdCellModel.h"

@interface RmdTextCell ()
/** cell的文字label */
@property (weak, nonatomic) IBOutlet UILabel *rmdTextLabel;
/** 显示文字 */
@property (nonatomic, copy) NSString *labelText;

@end

@implementation
RmdTextCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor whiteColor];
    // 设置label每一行文字的最大宽度
    // 为了保证计算出来的数值 跟 真正显示出来的效果 一致
    self.rmdTextLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


+ (instancetype)cellWithTabelView:(UITableView *)tableView rmdCellModel:(
                                                                         RmdCellModel *)rmdCellMode;
{
    static NSString *identifier = @"rmdTextCell";
    
    RmdTextCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    cell.model = rmdCellMode;
    
    return cell;
}

- (void)setModel:(RmdCellModel *)model
{
    _model = model;
    self.rmdTextLabel.text = model.ch;
    [self layoutIfNeeded];
    model.cellHeight = CGRectGetMaxY(self.rmdTextLabel.frame) + 10;
}

- (void)setLabelText:(NSString *)labelText
{
    _labelText = labelText;
    self.rmdTextLabel.text = labelText;
    
}



@end
