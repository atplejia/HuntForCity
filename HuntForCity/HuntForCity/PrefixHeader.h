//
//  PrefixHeader.h
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//
#import "Masonry.h"


//全局的绿色主题
#define Color(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define GolbalGreen Color(33, 197, 180)

//抽屉顶部距离 底部一样
#define ScaleTopMargin 35
//app的高度
#define AppWidth ([UIScreen mainScreen].bounds.size.width)
//app的宽度
#define AppHeight ([UIScreen mainScreen].bounds.size.height)

//是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

//判断系统版本号是否是iOS8以上
#define iOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0

//折扣详情
#define DISCOUNTDETAIL1 @"http://open.qyer.com/lastminute/get_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=%@%@"
#define DISCOUNTDETAIL2 @"&lat=40.03616355444207&lon=116.3638803295888&page=1&source=QYDiscountViewController&track_app_channel=App%2520Store&track_app_version=6.8&track_device_info=iPhone7%2C1&track_deviceid=7B6FA080-F9FB-44C1-B932-401CD69CD5D2&track_os=ios%25209.1&v=1"

//亚洲目的地详情
#define ASIADESTINATIONDETAIL @"http://open.qyer.com/qyer/footprint/country_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&country_id=%ld%@"
#define pa @"&lat=40.03622574273529&lon=116.363834514835&oauth_token=2c8a27f98da55363b7f5ca09940dc14c&page=1&track_app_channel=App%2520Store&track_app_version=6.8&track_device_info=iPhone7%2C1&track_deviceid=7B6FA080-F9FB-44C1-B932-401CD69CD5D2&track_os=ios%25209.1&track_user_id=6971539&v=1"

//目的地
#define DESTINATION @"http://open.qyer.com/qyer/footprint/continent_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=40.03623447101837&lon=116.363814398621&page=1&track_app_channel=App%2520Store&track_app_version=6.8&track_device_info=iPhone7%2C1&track_deviceid=7B6FA080-F9FB-44C1-B932-401CD69CD5D2&track_os=ios%25209.1&v=1"
