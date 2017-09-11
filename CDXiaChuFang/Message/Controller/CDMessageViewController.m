//
//  CDMessageViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/11.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMessageViewController.h"
#import "CDMessageView.h"

@interface CDMessageViewController ()

@property (nonatomic, strong) CDMessageView *messageView;

@end

@implementation CDMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"信箱";
    self.messageView = [[CDMessageView alloc] initWithFrame:(CGRect){0, -64, self.view.bounds.size}];
    [self.view addSubview:_messageView];
    [self buttonClickAciton];
}

- (void)buttonClickAciton
{
    __weak typeof(self) weakSelf = self;
    self.messageView.subscriptionBtnClickBlock = ^{
        NSLog(@"%@", weakSelf.title);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
