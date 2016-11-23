//
//  HomeCellModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "HomeCellModel.h"
#import <MJExtension/MJExtension.h>
@implementation HomeCellModel

+(instancetype)cellModelWithDict:(NSDictionary *)dict{
    
    HomeCellModel *model = [[self alloc] init];
    [model setKeyValues:dict];
    return model;
}

@end
