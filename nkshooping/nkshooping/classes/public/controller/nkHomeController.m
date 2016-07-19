//
//  nkHomeController.m
//  nkShooping
//
//  Created by 仇凯 on 16/7/12.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import "nkHomeController.h"
#import "nkFirstViewController.h"
#import "nkCateViewController.h"
#import "nkShopTrolleyViewController.h"
#import "nkMeViewController.h"
#import "nkHomeTabBar.h"

@interface nkHomeController ()

@end

@implementation nkHomeController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加tabBarItems
    [self setup];
}

// 设置tabBarItems
- (void)setup{
    
    nkFirstViewController *first = [nkFirstViewController firstController];
    [self setChildController:first title:@"首页" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    nkCateViewController *cate = [[nkCateViewController alloc]init];
    UINavigationController *ca = [[UINavigationController alloc]initWithRootViewController:cate];
    [self setChildController:ca title:@"孩子娱乐" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    nkShopTrolleyViewController *shop =[[nkShopTrolleyViewController alloc]init];
    [self setChildController:shop title:@"吃货地图" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    nkMeViewController *me =[[nkMeViewController alloc]init];
    [self setChildController:me title:@"游戏资讯" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    
    [self setValue:[[nkHomeTabBar alloc]init] forKeyPath:@"tabBar"];
}

// 设置子控制器
- (void)setChildController:(UIViewController *)child title:(NSString*)title image:(NSString *)img selectedImage:(NSString *)selectedImage{
    
    child.tabBarItem.title = title;
    child.tabBarItem.image = [[UIImage imageNamed:img] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    child.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:child];

}

- (void)viewDidLayoutSubviews{


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
