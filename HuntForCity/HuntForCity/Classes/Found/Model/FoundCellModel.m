
//
//  FoundCellModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "FoundCellModel.h"

@implementation FoundCellModel

//模型便利构造方法
+ (instancetype)foundCellModelWihtDict:(NSDictionary *)dict
{
    FoundCellModel *model = [[FoundCellModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
