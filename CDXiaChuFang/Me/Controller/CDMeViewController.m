//
//  CDMeViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/4.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMeViewController.h"
#import "CDMeHeadView.h"

@interface CDMeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CDMeViewController

static NSString *const MeTableID = @"cell";

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setTableHeaderView:[[CDMeHeadView alloc] initWithFrame:(CGRect){0, 0, CDScreenW, 350}]];
        [_tableView setTableFooterView:[[UIView alloc] init]];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MeTableID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我";
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDelegate -
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MeTableID forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MeTableID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    //    cell.textLabel.text = @"ceshi";
    return cell;
}

@end
