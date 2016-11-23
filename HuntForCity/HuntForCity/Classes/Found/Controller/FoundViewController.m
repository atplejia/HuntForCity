//
//  FoundViewController.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "FoundViewController.h"
#import "FoundModel.h"
#import "FoundThemeModel.h"
#import "FoundCollectionViewCell.h"
#import "FoundCollectionReusableView.h"
#import "FoundHeaderModel.h"
#import "DetailViewController.h"
#import "PrefixHeader.h"


static NSString *ID = @"CELLID";
static NSString *headID = @"foundyHeaderID";


@interface FoundViewController ()

@property (nonatomic,strong) NSArray *itemArray;

@end

@implementation FoundViewController


- (NSArray *)itemArray {
    
    if (_itemArray == nil) {
        
        _itemArray = [FoundModel getFoundList];
        
    }
    
    return _itemArray;
}


- (instancetype)init {
    
    UICollectionViewFlowLayout *collectionViewFL = [[UICollectionViewFlowLayout alloc] init];
    CGFloat margin = 10;
    CGFloat width = (AppWidth - 3 * margin) * 0.5;
    collectionViewFL.minimumLineSpacing = 10;
    collectionViewFL.minimumInteritemSpacing = 10;
    collectionViewFL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    collectionViewFL.headerReferenceSize = CGSizeMake(AppWidth, 200);
    collectionViewFL.itemSize = CGSizeMake(width, 150);
    return [super initWithCollectionViewLayout:collectionViewFL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏
    [self Nav];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = Color(239, 239, 244);
    [self.collectionView registerNib:[UINib nibWithNibName:@"FoundCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FoundCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                                        initWithTitle:@"发现"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return navigationItem;
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    
    return self.itemArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    FoundModel *foundModel = self.itemArray[section];
    
    return foundModel.themes.count;
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    FoundCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    FoundModel *foundModel = self.itemArray[indexPath.section];
    
    FoundThemeModel *themeModel = foundModel.themes[indexPath.row];
    
    cell.foundThemeModel = themeModel;
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail = [[DetailViewController alloc] init];
    [self presentModalViewController:detail animated:YES];
    return;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        FoundCollectionReusableView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID forIndexPath:indexPath];
        
        FoundModel *sectionItem = self.itemArray[indexPath.section];
        FoundHeaderModel *headerItem = sectionItem.header;
        headerV.foundHerderModel = headerItem;;
        
        return headerV;
    }else {
        
        
        return nil;
    }

}

@end
