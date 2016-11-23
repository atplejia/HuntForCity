//
//  FoundModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "FoundModel.h"
#import "MJExtension.h"

@implementation FoundModel


+ (NSDictionary *)objectClassInArray {
    
    return @{
             @"themes" : @"FoundThemeModel"
             };
    
}

+ (NSArray *)getFoundList {
    
    
    return [FoundModel mj_objectArrayWithFilename:@"Found.plist"];
}


@end
