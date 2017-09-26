//
//  CDMaketViewController.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/12.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMaketViewController.h"
#import<WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface CDMaketViewController ()<WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) JSContext *context;

@end

@implementation CDMaketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self setupWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupWebView
{
    // 创建配置
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 创建UserContentController（提供JavaScript向webView发送消息的方法）
    WKUserContentController* userContent = [[WKUserContentController alloc] init];
    // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
    [userContent addScriptMessageHandler:self name:@"NativeMethod"];
    // 将UserConttentController设置到配置文件
    config.userContentController = userContent;
    // 高端的自定义配置创建WKWebView
    self.webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:config];
    // 设置访问的URL
    NSURL *url = [NSURL URLWithString:@"https://www.xiachufang.com/page/ec-tab/"];
    // 根据URL创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // WKWebView加载请求
    [_webView loadRequest:request];
    // 将WKWebView添加到视图
    [self.view addSubview:_webView];
    
//    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:webView];
//    NSURL *url = [NSURL URLWithString:@"https://www.xiachufang.com/page/ec-tab/"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
}

#pragma mark - WKScriptMessageHandler -
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    // 判断是否是调用原生的
    if ([@"NativeMethod" isEqualToString:message.name]) {
        // 判断message的内容，然后做相应的操作
        if ([@"close" isEqualToString:message.body]) {
            
        }
    }
}

- (void)dealloc
{
    [_webView.configuration.userContentController removeScriptMessageHandlerForName:@"NativeMethod"];
}

@end
