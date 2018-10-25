//
//  MainTabBarViewController.m
//  layout_masonry
//
//  Created by Geraint on 2018/10/25.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*
     
     以自定义的方式实现UITabBarController
     步骤：
     新建一个继承自UITabBarController的子类
     将这个子类设置为根控制器
     在这个子类里面实现添加子控制器的方法
     
     */
    
    /*
     由于文字和图片一样是默认的蓝色，所以也要进行设置才能达到自己想要的效果
     方案一：通过setTitleTextAttributes属性设置(但是这个方法很麻烦，每次设置的时候都需要写很多代码)
     - setTitleTextAttributes设置的时候是通过字典设置的，所以先搞一个字典
     （ 方案一，太麻烦 )
     */
    /*
     文字属性（优化方案：）
     步骤：
    1、拿到那个item的apperance
    2、对这个item进行设置、
    3、之后所有的item都会是这个属性
     */
    // 通过appearance统一设置UITabBarItem的文字属性
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:15.0];     // 设置文字大小
    dic[NSForegroundColorAttributeName] = [UIColor grayColor]; // 设置文字的前景色
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = dic[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];  // 设置appearance
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    // 添加子控件
    UIViewController *mainViewController1 = [[UIViewController alloc] init];
    mainViewController1.tabBarItem.title = @"首页";  // 设置标题
    // 设置默认图片
    mainViewController1.tabBarItem.image = [UIImage imageNamed:@"icon_topic"];
    mainViewController1.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_topic_selected"];
    [mainViewController1.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    mainViewController1.view.backgroundColor = [UIColor grayColor]; //
    [self addChildViewController:mainViewController1];
    
    
    
    UIViewController *mainViewController2 = [[UIViewController alloc] init];
    mainViewController2.tabBarItem.title = @"云随访";
    mainViewController2.tabBarItem.image = [UIImage imageNamed:@"icon_topic"];
    mainViewController2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_topic_selected"];
    mainViewController2.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:mainViewController2];
    
    UIViewController *mainViewController3 = [[UIViewController alloc] init];
    mainViewController3.tabBarItem.title = @"患者圈";
    mainViewController3.tabBarItem.image = [UIImage imageNamed:@"icon_topic"];
    mainViewController3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_topic_selected"];
    mainViewController3.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:mainViewController3];
    
    UIViewController *mainViewController4 = [[UIViewController alloc] init];
    mainViewController4.tabBarItem.title = @"我的";
    mainViewController4.tabBarItem.image = [UIImage imageNamed:@"icon_topic"];
    mainViewController4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_topic_selected"];
    mainViewController4.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:mainViewController4];
    
    UIViewController *mainViewController5 = [[UIViewController alloc] init];
    mainViewController5.tabBarItem.title = @"中心";
    mainViewController5.tabBarItem.image = [UIImage imageNamed:@"icon_topic"];
    mainViewController5.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_topic_selected"];
    mainViewController5.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:mainViewController5];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
