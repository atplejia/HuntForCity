//
//  FoundCollectionViewCell.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "FoundCollectionViewCell.h"
#import "FoundThemeModel.h"


@interface FoundCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *desLable;

@end


@implementation FoundCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setFoundThemeModel:(FoundThemeModel *)foundThemeModel {
    
    _foundThemeModel = foundThemeModel;
    
    self.backImageView.image = [UIImage imageNamed:foundThemeModel.img];
    self.titleLable.text = foundThemeModel.title;
    self.desLable.text = foundThemeModel.keywords;
    
}

@end
