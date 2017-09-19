//
//  CDMainHeadView.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/20.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMainHeadView.h"
#import "CDVerticalButton.h"
#import "CDMainModel.h"
#import <UIButton+WebCache.h>

@interface CDMainHeadView()
@property (nonatomic, strong) UIButton *cookThingsBtn;
@property (nonatomic, strong) UIButton *cookAskBtn;
@property (nonatomic, strong) UIButton *leaderboardBtn;
@property (nonatomic, strong) UIButton *cookMenuBtn;

@property (nonatomic, strong) UIButton *thisWeekCookBtn;
@property (nonatomic, strong) UILabel *thisWeekCookLab;
@property (nonatomic, strong) UIButton *fllowAttentionBtn;
@property (nonatomic, strong) UILabel *fllowAttentionLab;

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation CDMainHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    [self cookThingsBtn];
    [self cookAskBtn];
    [self leaderboardBtn];
    [self cookMenuBtn];
    
}

- (void)buttonClickAction:(UIButton *)sender
{
    if (self.buttonClickWithTagBlock) {
        self.buttonClickWithTagBlock(sender.tag, nil);
    }
}

- (void)setNavsWithItem:(NSArray<Navs *> *)navs
{
    if (navs.count >= 4) {
        [self setNavWithBtn:_cookThingsBtn withItem:navs[0]];
        [self setNavWithBtn:_cookAskBtn withItem:navs[1]];
        [self setNavWithBtn:_leaderboardBtn withItem:navs[2]];
        [self setNavWithBtn:_cookMenuBtn withItem:navs[3]];
    }
}


- (void)setNavWithBtn:(UIButton *)btn withItem:(Navs *)navs
{
    [btn setTitle:navs.name forState:UIControlStateNormal];
    [btn sd_setImageWithURL:[NSURL URLWithString:navs.picurl] forState:UIControlStateNormal];
}

#pragma mark - lazy load -

- (UIButton *)cookThingsBtn
{
    if (!_cookThingsBtn) {
        _cookThingsBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];
            [btn setTitle:@"" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_cookThingsBtn];
        [_cookThingsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake(CDScreenW/4, 100));
        }];
    }
    return _cookThingsBtn;
}

- (UIButton *)cookAskBtn
{
    if (!_cookAskBtn) {
        _cookAskBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_cookAskBtn];
        [_cookAskBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_cookThingsBtn.mas_right);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake(CDScreenW/4, 100));
        }];
    }
    return _cookAskBtn;
}

- (UIButton *)leaderboardBtn
{
    if (!_leaderboardBtn) {
        _leaderboardBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_leaderboardBtn];
        [_leaderboardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_cookAskBtn.mas_right);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake(CDScreenW/4, 100));
        }];
    }
    return _leaderboardBtn;
}

- (UIButton *)cookMenuBtn
{
    if (!_cookMenuBtn) {
        _cookMenuBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_cookMenuBtn];
        [_cookMenuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leaderboardBtn.mas_right);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake(CDScreenW/4, 100));
        }];
    }
    return _cookMenuBtn;
}


@end
