//
//  FoundHeaderModel.h
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundHeaderModel : NSObject

@property (nonatomic, copy) NSString *detail;

@property (nonatomic, copy) NSString *feeltitle;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *title;

+ (instancetype)FoundHeadModelWithDict:(NSDictionary *)dict;


@end
