
//
//  RmdCellModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "RmdCellModel.h"

@implementation RmdCellModel

+ (instancetype)rmdCellModelWithDict:(NSDictionary *)dict
{
    RmdCellModel *cellModel = [[self alloc] init];
    cellModel.pic = dict[@"pic"];
    cellModel.ch = dict[@"ch"];
    
    return cellModel;
}


@end
