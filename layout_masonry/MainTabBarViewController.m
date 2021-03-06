//
//  详解来源：
//  https://www.jianshu.com/p/2f74a5d93faa
//  MainTabBarViewController.m
//  layout_masonry
//
//  Created by Geraint on 2018/10/25.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainTabBar.h"

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
    
    // 在这里调用下面的 封装方法：
    // 添加子控制器
    [self setupChildVC:@"首页" andImage:@"icon_topic" andSelectImage:@"icon_topic_selected"];
    [self setupChildVC:@"云随访" andImage:@"icon_topic" andSelectImage:@"icon_topic_selected"];
    [self setupChildVC:@"发布" andImage:@"tabBar_publish_icon" andSelectImage:@"tabBar_publish_click_icon"];   // 自定义的 tabBar（在MainTabBar.m中）
    [self setupChildVC:@"医生圈" andImage:@"icon_topic" andSelectImage:@"icon_topic_selected"];
    [self setupChildVC:@"我的" andImage:@"icon_topic" andSelectImage:@"icon_topic_selected"];
    //[self setupChildVC:@"中心" andImage:@"icon_topic" andSelectImage:@"icon_topic_selected"];
    
    
    
/*
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
    
*/
    
}

/*
 *
 * （ 封装 ）初始化子控制器
 *
 */
- (void)setupChildVC:(NSString *)title andImage:(NSString *)image andSelectImage:(NSString *)selectImage {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];  // 未选中图标
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage]; //选中时图标
    vc.view.backgroundColor = [UIColor yellowColor]; // 颜色统一了
    [self addChildViewController:vc];  // 每个标签展示的内容都是不同的一个View（数据内容、结构不同），这样切换既不会影响之前View还可以快速切回之前的View，就用方法：addChildViewController
}

@end
