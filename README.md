##前言
#####很高兴再给大家分享自己花了两个月时间完成的城觅2.0新版本的高仿，都是基于UI控件编写，特意多加了一些逻辑功能，解决在逻辑上碰到的问题，设计到自定义视图，SDK的环境搭建和使用，以及如何跟着API文档步骤来完成功能，本篇文章我会多写内容讲解一些逻辑上的功能(其实还是要靠大家动手去完成)，我们先看看项目结构哥内容

####开发语言:```Objective-C```

####开发工具:```Xcode8.1```

####辅助工具:```Photoshop CS6```

![Snip20161117_3.png](http://upload-images.jianshu.io/upload_images/1754828-725667592ed0804f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- *可以看到这是项目所有的结构和效果，传统的MVC模式*
- 效果图欣赏

![引导页.gif](http://upload-images.jianshu.io/upload_images/1754828-67fc6cde81e80b6d.gif?imageMogr2/auto-orient/strip)

![登录页.gif](http://upload-images.jianshu.io/upload_images/1754828-9b4676a4c2e0afed.gif?imageMogr2/auto-orient/strip)


![个人中心.gif](http://upload-images.jianshu.io/upload_images/1754828-1243ee32bf097f08.gif?imageMogr2/auto-orient/strip)


![更多.gif](http://upload-images.jianshu.io/upload_images/1754828-a6f9847fbb251ac3.gif?imageMogr2/auto-orient/strip)

- 以上就是针对维尼的小熊所更改变化的版本，本人在后续添加了一些第三方的框架使用和逻辑功能，更是在Xcode8.1新的编辑器所搭建的项目环境,首页和一些其他的功能，我这里就不做演示了，因为前版本已经有了，这里主要所说的就是添加了那些东西和如何使用

- 修改的 *Podfile*

```
use_frameworks!
platform :ios, "10.0"

target 'HuntForCity' do

pod "MJRefresh"
pod "MJExtension"
pod "SDWebImage"
pod "Masonry"
pod "AMap2DMap"
pod "AMapSearch"
pod "AFNetworking", '~> 3.0'

end

```
- 上述新的 *CocosPods*我也对更新了很多，也是最新版本用命令方式来生成第三方框架

### 个人中心

- 我这里讲一下个人中心的搭建
- 这种结构已经非常常见了，用Tableview加载自定义的view
- 重点就是主要头部的


![Snip20161123_10.png](http://upload-images.jianshu.io/upload_images/1754828-414a314391f6e3d8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self createUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


-(void)createUI
{
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AppWidth, 200)];
    view.backgroundColor = Color(239, 239, 244);
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake((AppWidth-100)/2, 50, 100, 100)];
    image.image = [UIImage imageNamed:@"Profileimage.png"];
    image.layer.cornerRadius = 50;
    image.layer.masksToBounds = YES;
    [view addSubview:image];
    _tableView.tableHeaderView = view;

}

-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;

    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

```

### 更多

- 更多页面我特意使用了`AFN`框架来解析一些数据，因为`发现`页面是加载本地数据，我们在公司项目中，不可能只做死的数据，要学会如何利用网络框架加载数据，来看看我们的页面是如何如何做的
- 在`- (void)viewDidLoad {}`写一个实现的方法`[self requestData];`

```

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

```


- [请求的地址](http://open.qyer.com/qyer/footprint/continent_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=40.03623447101837&lon=116.363814398621&page=1&track_app_channel=App%2520Store&track_app_version=6.8&track_device_info=iPhone7%2C1&track_deviceid=7B6FA080-F9FB-44C1-B932-401CD69CD5D2&track_os=ios%25209.1&v=1)

- 使用`Do Http`工具来查看数据

![Snip20161123_11.png](http://upload-images.jianshu.io/upload_images/1754828-2627a514b3dfe78f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 打断点进行分析

![Snip20161123_12.png](http://upload-images.jianshu.io/upload_images/1754828-9b2a665b9e970fde.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 最后显示效果
- 用本地的模型和得到的数据模型来相互赋值，这样就可以显示出来了

```
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

```

### 有关ShareSDK分享
-  [官网地址](http://wiki.mob.com/ios%E7%AE%80%E6%B4%81%E7%89%88%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90/)

![Snip20161123_13.png](http://upload-images.jianshu.io/upload_images/1754828-18e2a2358c512876.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 我这里介绍不完，需要个人自己探索API文档，按照文档的步骤一步一步来实现，还有更多的平台我这里暂时分享给大家

![Snip20161123_14.png](http://upload-images.jianshu.io/upload_images/1754828-a19a1264bb2e226a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
