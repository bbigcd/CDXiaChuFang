//
//  CDMainHeadView.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/20.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMainHeadView.h"
#import "CDMainVerticalButton.h"
#import "CDMainModel.h"
#import <UIButton+WebCache.h>

@interface CDMainHeadView()
@property (nonatomic, strong) CDMainVerticalButton *cookThingsBtn;
@property (nonatomic, strong) CDMainVerticalButton *cookAskBtn;
@property (nonatomic, strong) CDMainVerticalButton *leaderboardBtn;
@property (nonatomic, strong) CDMainVerticalButton *cookMenuBtn;

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
    [self thisWeekCookBtn];
    [self fllowAttentionBtn];
    
}

- (void)buttonClickAction:(UIButton *)sender
{
    if (self.buttonClickWithTagBlock) {
        self.buttonClickWithTagBlock(sender.tag, nil);
    }
}

- (void)setContentWithItem:(Content *)item
{
    if (item.navs.count >= 4) {
        [self setNavWithBtn:_cookThingsBtn withItem:item.navs[0]];
        [self setNavWithBtn:_cookAskBtn withItem:item.navs[1]];
        [self setNavWithBtn:_leaderboardBtn withItem:item.navs[2]];
        [self setNavWithBtn:_cookMenuBtn withItem:item.navs[3]];
    }
    if (item.popRecipeRicurl != NULL) {
        [self.thisWeekCookBtn sd_setImageWithURL:[NSURL URLWithString:item.popRecipeRicurl] forState:UIControlStateNormal];
        [self.fllowAttentionBtn setImage:[UIImage imageNamed:@"feedsNotLogin_320x240_"] forState:UIControlStateNormal];
    }
}


- (void)setNavWithBtn:(UIButton *)btn withItem:(Navs *)navs
{
    [btn setTitle:navs.name forState:UIControlStateNormal];
    [btn sd_setImageWithURL:[NSURL URLWithString:navs.picurl] forState:UIControlStateNormal];
}

#pragma mark - lazy load -

- (CDMainVerticalButton *)cookThingsBtn
{
    if (!_cookThingsBtn) {
        _cookThingsBtn = ({
            CDMainVerticalButton *btn = [[CDMainVerticalButton alloc] init];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
//            btn.backgroundColor = [UIColor grayColor];
            btn.tag = 100;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_cookThingsBtn];
        [_cookThingsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake((CDScreenW-20)/4, 100));
        }];
    }
    return _cookThingsBtn;
}

- (CDMainVerticalButton *)cookAskBtn
{
    if (!_cookAskBtn) {
        _cookAskBtn = ({
            CDMainVerticalButton *btn = [[CDMainVerticalButton alloc] init];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            btn.tag = 200;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_cookAskBtn];
        [_cookAskBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_cookThingsBtn.mas_right);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake((CDScreenW-20)/4, 100));
        }];
    }
    return _cookAskBtn;
}

- (CDMainVerticalButton *)leaderboardBtn
{
    if (!_leaderboardBtn) {
        _leaderboardBtn = ({
            CDMainVerticalButton *btn = [[CDMainVerticalButton alloc] init];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            btn.tag = 300;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_leaderboardBtn];
        [_leaderboardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_cookAskBtn.mas_right);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake((CDScreenW-20)/4, 100));
        }];
    }
    return _leaderboardBtn;
}

- (UIButton *)cookMenuBtn
{
    if (!_cookMenuBtn) {
        _cookMenuBtn = ({
            CDMainVerticalButton *btn = [[CDMainVerticalButton alloc] init];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            btn.tag = 400;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_cookMenuBtn];
        [_cookMenuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leaderboardBtn.mas_right);
            make.top.equalTo(@10);
            make.size.mas_offset(CGSizeMake((CDScreenW-20)/4, 100));
        }];
    }
    return _cookMenuBtn;
}

- (UIButton *)thisWeekCookBtn
{
    if (!_thisWeekCookBtn) {
        _thisWeekCookBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor cd_mainHeadViewNormalBgColor];
            btn.tag = 500;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_thisWeekCookBtn];
        [_thisWeekCookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@16);
            make.top.equalTo(_cookThingsBtn.mas_bottom);
            make.size.mas_offset(CGSizeMake((CDScreenW-46)/2, 140));
        }];
        
        // label
        self.thisWeekCookLab = [[UILabel alloc] init];
        _thisWeekCookLab.text = @"流行菜谱";
        _thisWeekCookLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        _thisWeekCookLab.textColor = [UIColor whiteColor];
        [_thisWeekCookBtn addSubview:self.thisWeekCookLab];
        [_thisWeekCookLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_thisWeekCookBtn.mas_left).offset(16);
            make.bottom.equalTo(_thisWeekCookBtn.mas_bottom).offset(-16);
        }];
        UILabel *label = [[UILabel alloc] init];
        label.text = @"本周";
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        label.textColor = [UIColor whiteColor];
        [_thisWeekCookBtn addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_thisWeekCookBtn.mas_left).offset(16);
            make.bottom.equalTo(_thisWeekCookLab.mas_top).offset(-5);
        }];
        
    }
    return _thisWeekCookBtn;
}

- (UIButton *)fllowAttentionBtn
{
    if (!_fllowAttentionBtn) {
        _fllowAttentionBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor cd_mainHeadViewNormalBgColor];
            btn.tag = 600;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_fllowAttentionBtn];
        [_fllowAttentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_thisWeekCookBtn.mas_right).offset(14);
            make.top.equalTo(_cookThingsBtn.mas_bottom);
            make.size.mas_offset(CGSizeMake((CDScreenW-46)/2, 140));
        }];
        
        self.fllowAttentionLab = [[UILabel alloc] init];
        _fllowAttentionLab.text = @"关注动态";
        _fllowAttentionLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        _fllowAttentionLab.textColor = [UIColor whiteColor];
        [_fllowAttentionBtn addSubview:self.fllowAttentionLab];
        [_fllowAttentionLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_fllowAttentionBtn.mas_left).offset(16);
            make.bottom.equalTo(_fllowAttentionBtn.mas_bottom).offset(-16);
        }];
    }
    return _fllowAttentionBtn;
}

@end
