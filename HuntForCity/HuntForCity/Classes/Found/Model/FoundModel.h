//
//  FoundModel.h
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FoundHeaderModel;

@interface FoundModel : NSObject


@property (nonatomic,strong) FoundHeaderModel *header;

@property (nonatomic,strong) NSArray *themes;

+ (NSArray *)getFoundList;

@end
