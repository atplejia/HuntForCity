//
//  City.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "City.h"

@implementation City

@end


#pragma mark - CityGroup
@implementation CityGroup

- (NSMutableArray *) arrayCitys
{
    if (_arrayCitys == nil) {
        _arrayCitys = [[NSMutableArray alloc] init];
    }
    return _arrayCitys;
}

@end
