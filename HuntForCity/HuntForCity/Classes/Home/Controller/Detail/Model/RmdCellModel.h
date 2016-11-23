//
//  RmdCellModel.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RmdCellModel : NSObject

//文字
@property (nonatomic, copy) NSString *ch;
//图片地址str
@property (nonatomic, copy) NSString *pic;

/** 记录文字cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

+ (instancetype)rmdCellModelWithDict:(NSDictionary *)dict;

@end
