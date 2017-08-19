//
//  CDTabBarViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/16.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDTabBarViewController.h"
#import "CDNavigationViewController.h"
#import "CDMainViewController.h"
@interface CDTabBarViewController ()

@end

@implementation CDTabBarViewController

+ (void)initialize
{
    /*
     * 通过appearance统一设置所有UITabBarItem的文字属性
     * 后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
     * NSForegroundColorAttributeName 相对于 NSBackgroundColorAttributeName
     */
    // 常态属性
    NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttribute[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 选中属性
    NSMutableDictionary *selectedAttribute = [NSMutableDictionary dictionary];
    selectedAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectedAttribute[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.96 green:0.41 blue:0.30 alpha:1.00];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttribute forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildViewController:[CDMainViewController new] title:@"下厨房" image:@"tab_home_normal" selectedImage:@"tab_home_selected"];
    [self setupChildViewController:[UIViewController new] title:@"市集" image:@"tab_fair_normal" selectedImage:@"tab_fair_selected"];
    [self setupChildViewController:[UIViewController new] title:@"收藏" image:@"tab_fair_normal" selectedImage:@"tab_fair_selected"];
    [self setupChildViewController:[UIViewController new] title:@"信箱" image:@"tab_mailbox_normal" selectedImage:@"tab_mailbox_selected"];
    [self setupChildViewController:[UIViewController new] title:@"我" image:@"tab_me_normal" selectedImage:@"tab_me_selected"];
}

/**
 *  初始化TabBar控制器
 *
 *  @param ViewController 子控制器
 *  @param title            控制器的标签
 *  @param image            控制器的常态图片
 *  @param selectedImage    控制器的被选中图片
 */
- (void)setupChildViewController:(UIViewController *)ViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    ViewController.tabBarItem.title = title;
    ViewController.tabBarItem.image = [UIImage imageNamed:image];
    ViewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 包装一个导航控制器， 添加导航控制器为tabBarViewcontroller的子控制器
    CDNavigationViewController *navi = [[CDNavigationViewController alloc] initWithRootViewController:ViewController];
    [self addChildViewController:navi];
}

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
