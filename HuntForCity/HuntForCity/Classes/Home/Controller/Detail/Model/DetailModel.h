//
//  DetailModel.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ArticleModel;

@interface DetailModel : NSObject

/** detail列表 */
@property (nonatomic, strong) NSArray *poi_list;

/** 头部信息 */
@property (nonatomic, strong) NSDictionary *section_info;

/** 推荐tableveiw数据 */
@property (nonatomic, strong) NSArray *article_list;

+ (instancetype)detailModelWith:(NSDictionary *)dict;

@end
