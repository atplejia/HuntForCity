//
//  RmdPicCell.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "RmdPicCell.h"
#import "UIImageView+WebCache.h"

@interface RmdPicCell()

//图片view
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@end

@implementation RmdPicCell

- (void)awakeFromNib {
    self.picImageView.contentMode = UIViewContentModeScaleToFill;
    self.contentView.clipsToBounds = YES;
}

+ (instancetype)cellWithTabelView:(UITableView *)tableView rmdPicModel:(RmdCellModel *)model
{
    static NSString *identifier = @"rmdPicCell";
    
    RmdPicCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    
    
    cell.model = model;
    return cell;
}

- (void)setModel:(RmdCellModel *)model
{
    _model = model;
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"cover_headerView"]];
}


@end
