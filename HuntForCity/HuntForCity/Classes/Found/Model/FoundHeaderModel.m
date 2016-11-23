//
//  FoundHeaderModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "FoundHeaderModel.h"

@implementation FoundHeaderModel


+ (instancetype)FoundHeadModelWithDict:(NSDictionary *)dict {
    
    FoundHeaderModel *headeModel = [[FoundHeaderModel alloc] init];
    
    [headeModel setValuesForKeysWithDictionary:dict];
    
    return headeModel;
    
}



@end
