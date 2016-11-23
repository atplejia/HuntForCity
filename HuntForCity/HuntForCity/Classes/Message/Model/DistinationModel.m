//
//  DistinationModel.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/11/2.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DistinationModel.h"

@implementation DistinationModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"data":@"DataModel"};
}

@end
@implementation DataModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{@"hot_country":@"HotCountryModel",@"country":@"CountryModel"};
}
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
@end

@implementation HotCountryModel


+(NSDictionary*)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
@end

@implementation CountryModel

+(NSDictionary*)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}

@end
