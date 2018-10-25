//
//  AppDelegate.m
//  layout_masonry
//
//  Created by Geraint on 2018/10/25.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "AppDelegate.h"

#import "MainTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //[self.window makeKeyAndVisible];
     // 设置窗口的跟控制器
    MainTabBarViewController *mainVC = [[MainTabBarViewController alloc] init];
    //self.window.rootViewController = mainVC;
    
    
    /*
     
     【   作者：STzen
     链接：https://www.jianshu.com/p/2f74a5d93faa
     來源：简书
     简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。】
     
     但是这样在appdelegate里面进行设置会有很多缺点：
     
     底部tabbaritem都是默认的蓝色
     添加子控制器的代码暴露在了外面
     以自定义的方式实现UITabBarController
     步骤：
     新建一个继承自UITabBarController的子类
     将这个子类设置为根控制器
     在这个子类里面实现添加子控制器的方法
     但是在这种情况下因为有系统默认的蓝色渲染，会导致选中图标selectedImage不是图片原来的样子，可以通过以下两种方式解决：
     
     */
    
    
    /*
    
    // 添加子控件
    UIViewController *mainViewController1 = [[UIViewController alloc] init];
    mainViewController1.tabBarItem.title = @"首页";  // 设置标题
    // 设置默认图片
    mainViewController1.tabBarItem.image = [UIImage imageNamed:@"icon_topic"];
    // 设置选中图片
    mainViewController1.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_topic_selected"];
    mainViewController1.view.backgroundColor = [UIColor grayColor]; //
    [mainVC addChildViewController:mainViewController1];
    
    UIViewController *mainViewController2 = [[UIViewController alloc] init];
    mainViewController2.tabBarItem.title = @"云随访";
    mainViewController2.view.backgroundColor = [UIColor greenColor];
    [mainVC addChildViewController:mainViewController2];
    
    UIViewController *mainViewController3 = [[UIViewController alloc] init];
    mainViewController3.tabBarItem.title = @"患者圈";
    mainViewController3.view.backgroundColor = [UIColor blueColor];
    [mainVC addChildViewController:mainViewController3];
    
    UIViewController *mainViewController4 = [[UIViewController alloc] init];
    mainViewController4.tabBarItem.title = @"我的";
    mainViewController4.view.backgroundColor = [UIColor redColor];
    [mainVC addChildViewController:mainViewController4];
    
    UIViewController *mainViewController5 = [[UIViewController alloc] init];
    mainViewController5.tabBarItem.title = @"中心";
    mainViewController5.view.backgroundColor = [UIColor yellowColor];
    [mainVC addChildViewController:mainViewController5];
    
     */
     
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    return YES;
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
