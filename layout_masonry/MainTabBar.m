//
//  MainTabBar.m
//  layout_masonry
//
//  Created by Geraint on 2018/10/25.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "MainTabBar.h"

/*
 
 自定义底部tabBar样式：比如，在tabBar上添加一个按钮button（注意不是原来的item，tabBarItem是图片在上，文字在下的格式）
 
 步骤：
 新建一个继承自UITabbar的类
 在这个类里面实现初始化
 在layoutSubviews方法里面重新布局
 在TabbarController里面跟换tabbar
 虽然我们在TabbarController里面换成了自定义的tabbar，但是因为这个tabbar继承自uitabbar，所以它原来的属性和内容还在
 
 */

@interface MainTabBar ()
@property (nonatomic, weak) UIButton *publishBotton;  // 发布按钮
@end


@implementation MainTabBar

// 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 设置tabBar的子控件 icon_topic_selected
        UIButton *publishBotton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBotton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBotton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishBotton sizeToFit];
        
        [self addSubview:publishBotton];
        self.publishBotton = publishBotton;  // ”self.publishBotton“是上面声明的属性
    }
    return self;
}

// 重写布局子控件的方法进行布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // 设置发布按钮的frame(button的大小)
    self.publishBotton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 设置其他的UITabBar的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width /5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    
    for (UIView *button in self.subviews) {
        
        // 判断 - 只有是UITabBarButton的button才进行布局（也就是tabbar上面的首页、云随访、医生圈、我的、中心这五个按钮）而发布按钮不是UITabBarButton，就不进行布局
        // 由于UITabBar是苹果官方私有的， 所以不能直接设置
        if (![button isKindOfClass:NSClassFromString(@"UITaBarButton")]) continue;
        
        // 计算按钮的X值
        CGFloat buttonx = buttonW * ((index > 1) ? (index + 1) : (index));
        button.frame = CGRectMake(buttonx, buttonY, buttonW, buttonH);
        
        
        // 索引增加
        index ++;
        
    }
    
}

@end
