//
//  AppDelegate.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "GuideViewController.h"

#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

/*
    ShareSDK 这是一个免费的SDK，这是我就不显示自己的APPKey了。可以自己去申请
 
 */


/*ShareSDK*/
#define ShareAppKey @"69669********2840e8d63ebd"
/*微信平台*/
#define WXAppID @"wxeba*******8f19d65"
#define WXAppSecret @"d4624c36b6*******87af5443d"
/*QQ平台*/
#define QQAppID @"11*****825"
#define QQAppKey @"97Z*****P8N4EB"



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /*ShareSDK分享功能*/
    [self share];
    
    //判断是不是第一次启动应用
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        GuideViewController *userGuideViewController = [[GuideViewController alloc] init];
        self.window.rootViewController = userGuideViewController;
        [userGuideViewController release];
        
    }else{
        
        self.window.rootViewController = [[LoginViewController alloc] init];
        //这里最好释放一下内存
        [LoginViewController release];
    }
    
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];

    

    return YES;
}

-(void)share{
    
    /**社会化分享*/
    [ShareSDK registerApp:ShareAppKey];
    
    //1.添加微信应用  http://open.weixin.qq.com/
    [ShareSDK connectWeChatWithAppId:WXAppID
                           appSecret:WXAppSecret
                           wechatCls:[WXApi class]];
    
    //2.微信朋友圈    http://open.weixin.qq.com/
    [ShareSDK connectWeChatTimelineWithAppId:WXAppID appSecret:WXAppSecret wechatCls:[WXApi class]];
    
    //3.QQ   http://connect.qq.com/
    [ShareSDK connectQQWithAppId:QQAppID qqApiCls:[QQApiInterface class]];
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
