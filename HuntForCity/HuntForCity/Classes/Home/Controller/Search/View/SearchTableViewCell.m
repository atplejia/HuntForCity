//
//  SearchTableViewCell.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "SearchTableViewCell.h"

@interface SearchTableViewCell ()
@property(weak,nonatomic) IBOutlet UIButton *deleteBtn;

@end

@implementation SearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.keyWordLb.numberOfLines = 1;
    self.backgroundColor = [UIColor whiteColor];
}

- (IBAction)deleteClick:(UIButton *)sender {
    if (self.delegate &&[self.delegate respondsToSelector:@selector(deleteButtonClick:)]) {
        [self.delegate deleteButtonClick:self.keyWordLb.text];
    }
}
@end
