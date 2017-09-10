//
//  CDMeViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/4.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMeViewController.h"
#import "CDMeHeadView.h"
#import "CDMeNoDataCell.h"
#import "CDMeDataModel.h"

@interface CDMeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CDMeHeadView *tableHeadView;
@property (nonatomic, strong) NSDictionary *noDataDic;

@end

@implementation CDMeViewController
static NSString *const MeNoDataCell = @"MeNoDataCell";
static NSString *const MeTableID = @"cell";

- (CDMeHeadView *)tableHeadView
{
    if (_tableHeadView == nil) {
        _tableHeadView = [[CDMeHeadView alloc] initWithFrame:(CGRect){0, 0, CDScreenW, 350}];
        
    }
    return _tableHeadView;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setTableHeaderView:self.tableHeadView];
        [_tableView setTableFooterView:[[UIView alloc] init]];
        [_tableView setBackgroundColor:[UIColor cd_selfViewBackgroundColor]];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MeTableID];
        [_tableView registerClass:[CDMeNoDataCell class] forCellReuseIdentifier:MeNoDataCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cd_selfViewBackgroundColor];
    self.title = @"我";
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.noDataDic = [CDMeDataModel tableCookbookNoDataDic];
    [self tableView];
    [self setupBtnsAction];
}

- (void)setupBtnsAction
{
    __weak typeof(self) weakSelf = self;
    self.tableHeadView.buttonCickBlock = ^(NSInteger tag, id item){
//        NSLog(@"%@", weakSelf.title);
        if(tag == 100){
            weakSelf.noDataDic = [CDMeDataModel tableCookbookNoDataDic];
            [weakSelf.tableView reloadData];
        }else if (tag == 200){
            weakSelf.noDataDic = [CDMeDataModel tableProductionNoDataDic];
            [weakSelf.tableView reloadData];
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDelegate -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDMeNoDataCell *cell = [tableView dequeueReusableCellWithIdentifier:MeNoDataCell forIndexPath:indexPath];
    if (!cell) {
        CDMeNoDataCell *cell = [[CDMeNoDataCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MeNoDataCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLabel.text = self.noDataDic[@"titleLabel"];
    cell.detailLabel.text = self.noDataDic[@"detailLabel"];
    return cell;
}


@end
