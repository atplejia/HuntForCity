//
//  RmndCell.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "RmndCell.h"
#import "PrefixHeader.h"
#import "UIImageView+WebCache.h"

@interface RmndCell()

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (weak, nonatomic) IBOutlet UILabel *praiseLabel;

@end


@implementation RmndCell



- (void)awakeFromNib {
    
    self.backgroundColor = Color(51, 52, 53);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView model:(HomeCellModel *)model
{
    static NSString *ID = @"rmndCell";
    RmndCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RmndCell class]) owner:nil options:nil] lastObject];
    }
    
    [cell.backImageView sd_setImageWithURL:[NSURL URLWithString:model.imageURL] placeholderImage:[UIImage imageNamed:@"ContentViewNoImages"]];
    
    cell.nameLabel.text = model.section_title;
    cell.adressLabel.text = model.poi_name;
    cell.praiseLabel.text = model.fav_count;
    
    return cell;
}


@end
