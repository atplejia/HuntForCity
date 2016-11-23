//
//  DetailModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DetailModel.h"
#import "ArticleModel.h"
#import "MJExtension.h"

@implementation DetailModel

+ (instancetype)detailModelWith:(NSDictionary *)dict
{
    DetailModel *detail = [[self alloc] init];
    
    [detail setKeyValues:dict];
    
    return detail;
}


@end
