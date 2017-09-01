//
//  CDMainViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/19.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMainViewController.h"
#import "CDMainHeadView.h"
#import "CDMainModel.h"
#import <NSObject+YYModel.h>

@interface CDMainViewController ()
<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CDMainModel *model;

@end

@implementation CDMainViewController

static NSString *const MainTableID = @"cell";

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setTableFooterView:[[UIView alloc] init]];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MainTableID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.model = [[CDMainModel alloc] init];
    [self tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self network];
        [self.tableView.mj_header endRefreshing];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)network
{
    NSString *url = @"http://api.xiachufang.com/v2/init_page_v5.json";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_ts"] = @"1473090254.801338";
    params[@"api_key"] = @"07397197043fafe11ce5c65c10febf84";
    params[@"api_sign"] = @"a622485cbb002f950c18c8393e9d84f1";
    params[@"location_code"] = @"156440300000000";
    params[@"nonce"] = @"50C8CAEA-0A38-4B89-B3C3-645580759EFE";
    params[@"origin"] = @"iphone";
    params[@"sk"] = @"xtMHPgLaSnWmBJulQ-zPOQ";
    params[@"timezone"] = @"Asia/Shanghai";
    params[@"version"] = @"5.8.2";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.model = [CDMainModel yy_modelWithJSON:responseObject];
        NSLog(@"%@",self.model.status);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MainTableID forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MainTableID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
//    cell.textLabel.text = @"ceshi";
    return cell;
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
