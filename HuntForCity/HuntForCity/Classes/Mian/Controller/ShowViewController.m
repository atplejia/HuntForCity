//
//  ShowViewController.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//
#import "DetailViewController.h"
#import "ShowViewController.h"
#import "MapViewController.h"
#import "HomeCellModel.h"
#import "RefresgHeader.h"
#import "PrefixHeader.h"
#import "UIImage+Size.h"
#import "MJRefresh.h"
#import "RmndCell.h"
@interface ShowViewController ()<UITableViewDataSource,UITableViewDelegate,ConditionViewDelegate, RenderBlurViewDelegate>

/** 数据源 */
@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化UI
    [self setUpUI];
    
    //设置上拉刷新
    [self setHeadRefresh];

}

//懒加载数据
- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CellDatas" ofType:@"plist"]];
        for (NSDictionary *dict in arr) {
            HomeCellModel *model = [HomeCellModel cellModelWithDict:dict];
            [_datas addObject:model];
        }
    }
    return _datas;
}

- (void)setHeadRefresh
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    RefresgHeader *header = [RefresgHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 马上进入刷新状态
    [header beginRefreshing];
    
    // 设置header
    self.tableView.header = header;
}

//下拉加载数据
- (void)loadNewData
{
    //模拟1秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;

    //添加tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, AppHeight)
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
//    
//    //添加选项栏
//    CBCategoryView * categoryView = [[CBCategoryView alloc] initWithPosition:CGPointMake(0,66) andHeight:40];
//    [self.view addSubview:categoryView];
//    categoryView.controller(self)
//    .data(self.category)
//    .decodeData(^(NSDictionary * data){
//        return data[@"name"];
//    })
//    .reloadData();
    
    //添加顶部条件选择view
    self.conditionView = [[ConditionView alloc] init];
    
    CGFloat conditionViewW = AppWidth * 0.9;
    CGFloat conditionViewH = conditionViewW * 0.13;
    CGFloat conditionViewX = AppWidth * 0.05;
    CGFloat conditionViewY = 30;
    
    self.conditionView.frame = CGRectMake(conditionViewX, conditionViewY, conditionViewW, conditionViewH);
    self.conditionView.delegate = self;
    [self.view addSubview:self.conditionView];
    
    //初始化地图
    self.mapVC = [[MapViewController alloc] init];
    [self addChildViewController:self.mapVC];
    [self.view insertSubview:self.mapVC.view belowSubview:self.conditionView];
    self.mapVC.view.alpha = 0;
    self.mapVC.view.hidden = YES;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCellModel *model = self.datas[indexPath.row];
    RmndCell *cell = [RmndCell cellWithTableView:self.tableView model:model];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 210.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //推出详情页 将对应的模型取出并传到详情页的模型里
    
    DetailViewController *detail = [[DetailViewController alloc] init];
    [self presentModalViewController:detail animated:YES];
}

#pragma mark - ConditionViewDelegate
- (void)conditionView:(ConditionView *)view didButtonClickFrom:(ConditionButtonType)from to:(ConditionButtonType)to
{
    //    //渲染当前的tableView的图片,并且模糊
    if (self.blurImageView == nil) {
        self.blurImageView = [RenderBlurView renderBlurViewWithImage:[UIImage imageWithCaputureView:self.tableView]];
        self.blurImageView.delegate = self;
        
        CGFloat blurY = self.view.bounds.size.height == AppHeight ? 64 : 0;
        
        self.blurImageView.frame = CGRectMake(0, blurY, AppWidth, AppHeight - 64);
        [self.view insertSubview:self.blurImageView belowSubview:self.conditionView];
        [UIView animateWithDuration:0.3 animations:^{
            self.blurImageView.alpha = 1.0;
        }];
    } else {
        
    }
}

- (void)conditionViewdidSelectedMap:(ConditionView *)view
{
    [self hideBlurView];
    
    self.mapVC.view.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.mapVC.view.alpha = 1.0;
    }];
}

- (void)conditionViewdidSelectedList:(ConditionView *)view
{
    [UIView animateWithDuration:0.3 animations:^{
        self.mapVC.view.alpha = 0;
    } completion:^(BOOL finished) {
        self.mapVC.view.hidden = YES;
    }];
}

- (void)conditionViewCancelSelectButton:(ConditionView *)view
{
    [self hideBlurView];
}

//隐藏模糊的view
- (void)hideBlurView
{
    [self.blurImageView hideBlurView];
    self.blurImageView = nil;
}

//重新定义导航条的状态
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"recomend_btn_gone"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        [UIView animateWithDuration:0.2 animations:^{
            self.conditionView.alpha = 0;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.conditionView.alpha = 1;
        }];
    }
}

#pragma mark - RenderBlurViewDelegate
//点击了X号
- (void)renderBlurViewCancelBtnClick:(RenderBlurView *)view
{
    [self.conditionView cancelSelectedAllButton];
    self.blurImageView = nil;
}

//选择了按钮
- (void)renderBlurView:(RenderBlurView *)view didSelectedCellWithTitle:(NSString *)title
{
    [self.tableView.header beginRefreshing];
    self.blurImageView = nil;
    [self.conditionView cancelSelectedAllButton];
}

@end
