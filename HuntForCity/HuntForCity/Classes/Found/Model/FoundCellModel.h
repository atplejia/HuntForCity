//
//  FoundCellModel.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundCellModel : NSObject

/** 图片名 */
@property (nonatomic, copy) NSString *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 副标题 */
@property (nonatomic, copy) NSString *subTitle;

+ (instancetype)foundCellModelWihtDict:(NSDictionary *)dict;

@end
