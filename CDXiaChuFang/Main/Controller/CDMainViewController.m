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
#import "CDMainDataSource.h"
#import "CDHeadMenuCell.h"
#import "CDMainSearchBar.h"
#import "CDHeadMenuCell+ConfigureForMemuCell.h"

@interface CDMainViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CDMainModel *model;
@property (nonatomic, strong) CDMainDataSource *mainDataSource;
@property (nonatomic, strong) CDMainHeadView *headView;
@property (nonatomic, strong) CDMainSearchBar *searchBar;
@end

@implementation CDMainViewController

static NSString *const MainTableID = @"MainTableID";

- (CDMainHeadView *)headView
{
    if (!_headView) {
        _headView = [[CDMainHeadView alloc] initWithFrame:(CGRect){0, 0, CDScreenW, 400}];
//        _headView.backgroundColor = [UIColor blueColor];
        _headView.buttonClickWithTagBlock = ^(NSInteger tag, id item) {
            NSLog(@"%ld", (long)tag);
        };
    }
    return _headView;
}


- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setTableHeaderView:self.headView];
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
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self setupBarButtonItem];
    [self setupSearchBar];
    self.model = [[CDMainModel alloc] init];
    [self tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self network];
//        [self netWork2];
        [self setupTableView];
        [self.tableView.mj_header endRefreshing];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)setupBarButtonItem
{
    UIBarButtonItem *leftItem = [self creatBarButtonWithImageName:@"creatrecipeicon_22x22_" Tag:100];
    UIBarButtonItem *rightItem = [self creatBarButtonWithImageName:@"buylistButtonImage_22x22_" Tag:200];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (UIBarButtonItem *)creatBarButtonWithImageName:(NSString *)imageName Tag:(NSInteger)tag
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(barButtonItemClick:)];
    item.tag = tag;
    return item;
}

- (void)barButtonItemClick:(UIBarButtonItem *)sender
{
    if (sender.tag == 100) {
        NSLog(@"100");
    }else if(sender.tag == 200){
        NSLog(@"200");
    }
    
}

- (void)setupSearchBar
{
    self.searchBar = [[CDMainSearchBar alloc] init];
    self.navigationItem.titleView = self.searchBar;
}

- (void)setupTableView
{
    //    __weak typeof(self) weakSelf = self;
    TableViewCellConfigureBlock configureCell = ^(CDHeadMenuCell *cell, NSArray<Navs *> *navs) {
        //        [cell configureForNavs:navs];
    };
    self.mainDataSource = [[CDMainDataSource alloc] initWithItems:_model.content.navs
                                                   cellIdentifier:MainTableID
                                               configureCellBlock:configureCell];
    self.tableView.dataSource = self.mainDataSource;
    
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
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.headView setContentWithItem:self.model.content];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)netWork2
{
    
    NSString *url = @"http://api.xiachufang.com/v2/issues/list.json";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"_ts"] = @"1473090255.173335";
    params[@"api_key"] = @"07397197043fafe11ce5c65c10febf84";
    params[@"api_sign"] = @"0d94e0c5bdf1f8aaf190f37f40f1af7b";
    params[@"cursor"] = @"";
    params[@"location_code"] = @"156440300000000";
    params[@"nonce"] = @"BDEFB717-254E-4236-8046-5C06F9D9C770";
    params[@"origin"] = @"iphone";
    params[@"size"] = @"2";
    params[@"sk"] = @"xtMHPgLaSnWmBJulQ-zPOQ";
    params[@"timezone"] = @"Asia/Shanghai";
    params[@"version"] = @"5.8.2";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
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

#pragma mark - TouchEvent -
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    [self.searchBar endEditing:YES];
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
