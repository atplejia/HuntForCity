//
//  FoundCollectionReusableView.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "FoundCollectionReusableView.h"
#import "FoundHeaderModel.h"


@interface FoundCollectionReusableView ()

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (weak, nonatomic) IBOutlet UILabel *desLable;



@end

@implementation FoundCollectionReusableView

- (void)setFoundHerderModel:(FoundHeaderModel *)foundHerderModel {
    
    _foundHerderModel = foundHerderModel;
    
    self.backImageView.image = [UIImage imageNamed:foundHerderModel.image];
    self.nameLable.text = foundHerderModel.feeltitle;
    self.desLable.text = foundHerderModel.title;
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
