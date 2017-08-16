//
//  CDTabBarViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/16.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDTabBarViewController.h"

@interface CDTabBarViewController ()

@end

@implementation CDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *view = [[UIViewController alloc] init];
    view.view.backgroundColor = [UIColor whiteColor];
    view.tabBarItem.title = @"test";
    [self addChildViewController:view];
    
    UIViewController *view1 = [[UIViewController alloc] init];
    view1.view.backgroundColor = [UIColor whiteColor];
    view1.tabBarItem.title = @"test1";
    [self addChildViewController:view1];
}

/**
 *  初始化TabBar控制器
 *
 *  @param ViewController 子控制器
 *  @param title            控制器的标签
 *  @param image            控制器的常态图片
 *  @param selectedImage    控制器的被选中图片
 */
//- (void)setupChildViewController:(UIViewController *)ViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
//{
//    // 设置文字和图片
//    ViewController.tabBarItem.title = title;
//    ViewController.tabBarItem.image = [UIImage imageNamed:image];
//    ViewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    // 包装一个导航控制器， 添加导航控制器为tabBarViewcontroller的子控制器
//    LLCNavigationController *navi = [[LLCNavigationController alloc] initWithRootViewController:ViewController];
//    [self addChildViewController:navi];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
