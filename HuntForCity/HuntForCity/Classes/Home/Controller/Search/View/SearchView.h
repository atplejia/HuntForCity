//
//  SearchView.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^backBlock)(id obj);

@protocol SearchViewDelegate;
@protocol SearchViewDataSource;

@interface SearchView : UIView

@property (nonatomic, weak) IBOutlet UITextField  *textField;
@property (nonatomic, weak) id<SearchViewDelegate> delegate;
@property (nonatomic, weak) id<SearchViewDataSource> datasource;
@property (nonatomic, copy) backBlock block;

@end


@protocol SearchViewDelegate <NSObject>
// 可选
@optional
// 输入中
- (NSArray *)searchView:(SearchView *)searchView didInputKeyWord:(NSString *)keyword;
// 选中某行
- (void)searchView:(SearchView *)searchView didSelectKeyWord:(NSString *)keyword;
 // 删除某行
- (void)searchView:(SearchView *)searchView didDeleteKeyWord:(NSString *)keyword;
// 搜索
- (void)searchView:(SearchView *)searchView shouldReturnKeyWord:(NSString *)keyword;
@end

// 必选
@protocol SearchViewDataSource <NSObject>
@required
// 返回数据源
- (NSArray *)searchView:(SearchView *)searchView;


@end
