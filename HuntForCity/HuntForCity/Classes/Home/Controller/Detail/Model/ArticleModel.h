//
//  ArticleModel.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

/** 浏览次数 */
@property (nonatomic, assign) NSInteger *viewcount;
/** 推荐tableviewcell的数据 */
@property (nonatomic, strong) NSArray *newcontent;
/** 推荐headViewtitle */
@property (nonatomic, copy) NSString *art_title;
/** 作者信息 */
@property (nonatomic, strong) NSDictionary *author_info;

@end
