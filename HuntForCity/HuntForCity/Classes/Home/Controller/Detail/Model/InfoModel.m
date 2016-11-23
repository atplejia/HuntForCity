//
//  InfoModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "InfoModel.h"

@implementation InfoModel

+ (instancetype)infoModelWithDict:(NSDictionary *)dict
{
    InfoModel *model = [[self alloc] init];
    model.title = dict[@"title"];
    model.subTitle = dict[@"subTitle"];
    model.isShowImage = [dict[@"isShowImage"] integerValue];
    return model;
}

@end
