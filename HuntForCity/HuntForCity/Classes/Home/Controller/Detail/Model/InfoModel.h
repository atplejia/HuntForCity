//
//  InfoModel.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, assign) BOOL isShowImage;
@property (nonatomic, assign) CGFloat cellHeight;

+ (instancetype)infoModelWithDict:(NSDictionary *)dict;

@end
