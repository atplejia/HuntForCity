//
//  DetailDistinationModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/11/2.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DetailDistinationModel.h"

@implementation DetailDistinationModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"data":@"InfoDataModel"};
}
@end

@implementation InfoDataModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"hot_city":@"HotcityModel",@"hot_mguide":@"HotmguideModel",@"discount":@"DiscountModel"};
}
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id",@"discount":@"new_discount"};
}


@end

@implementation HotmguideModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}


@end

@implementation HotcityModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}


@end

@implementation DiscountModel
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}


@end
