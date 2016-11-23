
//  MoreViewController.m
//  HuntForCity
//
//  Created by 金亮齐 on 2016/11/2.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "MoreViewController.h"
#import "PrefixHeader.h"
#import "AFNetworking.h"
#import "DistinationModel.h"
#import "HotCountryCell.h"
#import "UIImageView+WebCache.h"
#import "DistinationHeadView.h"
#import "MoreDistinaViewController.h"
#import "headView.h"
#import "DetailDistinationViewController.h"
@interface MoreViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,DistinationHeadViewDelegate>
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
}


@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Color(239, 239, 244);
    
    _dataArray = [NSMutableArray new];
    [self createCollectionView];
    //导航栏
    [self Nav];
    [self requestData];
}

-(void)Nav{
    //创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, AppWidth, 66)];
    //把导航栏集合添加到导航栏中，设置动画关闭，设置颜色
    [navBar pushNavigationItem:[self navItem] animated:NO];
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:26/255.0 green:198/255.0 blue:180/255.0 alpha:1.0]];
    [self.view addSubview:navBar];
}

-(UINavigationItem *)navItem{
    // 创建一个导航项
    UINavigationItem *navigationItem = [[UINavigationItem alloc]
                                        initWithTitle:@"更多"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return navigationItem;
}


-(void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 66, AppWidth, AppHeight) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView  registerNib:[UINib nibWithNibName:@"HotCountryCell" bundle:nil] forCellWithReuseIdentifier:@"HotCountryCell"];
    
    [_collectionView registerClass:[headView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    [_collectionView registerClass:[DistinationHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DistinationHeadView"];
}
-(void)requestData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:DESTINATION parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        DistinationModel *desModel=[[DistinationModel alloc]mj_setKeyValues:dic];
        NSMutableArray *array = [NSMutableArray new];
        array = desModel.data;
        for (DataModel *model in array)
        {
            [_dataArray addObject:model];
        }
        [_collectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataArray.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    DataModel *model = _dataArray[section];
    return model.hot_country.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HotCountryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotCountryCell" forIndexPath:indexPath];
    DataModel *model = _dataArray[indexPath.section];
    HotCountryModel *hotModel = model.hot_country[indexPath.row];
    
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:hotModel.photo]];
    cell.imageV.layer.cornerRadius = 8;
    cell.imageV.layer.masksToBounds = YES;
    cell.countryName.text = hotModel.cnname;
    cell.name.text = hotModel.enname;
    cell.count.text = [NSString stringWithFormat:@"%ld",hotModel.count];
    cell.city.text = hotModel.label;
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section % 2!=0) {
        return CGSizeMake((AppWidth-4)/2, 260*(AppHeight/667.0));
    }else{
        if (indexPath.row ==0) {
            return CGSizeMake(AppWidth, 200*(AppHeight/667.0));
        }else if (indexPath.row == 5)
        {
            return CGSizeMake(AppWidth, 200*(AppHeight/667.0));
        }
        else
        {
            return CGSizeMake((AppWidth-4)/2, 180*(AppHeight/667.0));
        }
    }
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}
//设置最小列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
#pragma mark 点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel *model = _dataArray[indexPath.section];
    HotCountryModel *hotModel = model.hot_country[indexPath.row];
    DetailDistinationViewController *detail = [[DetailDistinationViewController alloc]init];
    detail.DetialID = hotModel.ID;
    //[self.navigationController pushViewController:detail animated:YES];
    [self presentViewController:detail animated:YES completion:nil];
}
#pragma mark 设置头视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        DistinationHeadView *head = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"DistinationHeadView" forIndexPath:indexPath];
        DataModel *model = _dataArray[indexPath.section];
        NSString *str = [NSString stringWithFormat:@"查看%@更多目的地  >",model.cnname];
        [head.button setTitle:str forState:UIControlStateNormal];
        head.delegate = self;
        return head;
        
    }
    else{
        headView *head = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headView" forIndexPath:indexPath];
        DataModel *model = _dataArray[indexPath.section];
        NSString *str = [NSString stringWithFormat:@"    %@热门目的地",model.cnname];
        head.titleLabel.text = str;
        return head;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(AppWidth, 30*(AppHeight/667.0));
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(AppWidth, 30*(AppHeight/667.0));
}
#pragma mark 实现代理方法
-(void)sendButton:(UIButton *)button
{
    MoreDistinaViewController *more = [[MoreDistinaViewController alloc]init];
    [self.navigationController pushViewController:more animated:YES];
}


@end
