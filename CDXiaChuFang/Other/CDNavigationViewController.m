//
//  CDNavigationViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/17.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDNavigationViewController.h"

@interface CDNavigationViewController ()

@end

@implementation CDNavigationViewController

+ (void)initialize{
    // 当导航栏用在CDNavigationViewController中, appearance设置才会生效
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    // 属性带有appearance的对象，可以全局设置统一格式，而上述方法可以全局的同时局部差异。
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setTranslucent:NO];//全局不透明
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
