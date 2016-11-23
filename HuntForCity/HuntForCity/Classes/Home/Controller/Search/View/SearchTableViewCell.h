//
//  SearchTableViewCell.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchTableViewCell;

@protocol  SearchTableViewCellDelegate <NSObject>

- (void)deleteButtonClick:(NSString *)keyword;

@end

@interface SearchTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *keyWordLb;
@property (nonatomic, weak) id<SearchTableViewCellDelegate> delegate;

@end
