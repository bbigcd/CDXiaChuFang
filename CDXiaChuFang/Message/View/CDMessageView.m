//
//  CDMessageView.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/11.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMessageView.h"

@interface CDMessageView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIButton *subscriptionBtn;

@end


@implementation CDMessageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createdUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createdUI];
    }
    return self;
}

- (void)createdUI
{
    [self addSubview:self.detailLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subscriptionBtn];
    [self setUILayout];
}

- (void)setUILayout
{
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(_detailLabel.mas_top).offset(-50);
    }];
    [_subscriptionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_detailLabel.mas_bottom).offset(50);
    }];
}

- (void)subscriptionBtnAction
{
    if (self.subscriptionBtnClickBlock) {
        self.subscriptionBtnClickBlock();
    }
}

#pragma mark - lazy load -

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"等候着第一封信";
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.text = @"美味调剂生活，订阅你最喜欢的美食栏目，将会在这里收到最新的高人气菜谱和美文";
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.numberOfLines = 0;
        _detailLabel.textColor = [UIColor darkTextColor];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}

- (UIButton *)subscriptionBtn
{
    if (!_subscriptionBtn) {
        _subscriptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subscriptionBtn setTitle:@"去看看值得订阅的栏目" forState:UIControlStateNormal];
        UIColor *textColorNormal = [UIColor colorWithRed:0.93 green:0.42 blue:0.27 alpha:1.00];
        UIColor *textColorSelected = [UIColor colorWithRed:0.89 green:0.51 blue:0.44 alpha:1.00];
        [_subscriptionBtn setTitleColor:textColorNormal forState:UIControlStateNormal];
        [_subscriptionBtn setTitleColor:textColorSelected forState:UIControlStateSelected];
        [_subscriptionBtn addTarget:self action:@selector(subscriptionBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subscriptionBtn;
}

@end
