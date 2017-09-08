//
//  CDMeHeadView.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/4.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMeHeadView.h"
#import <UIImageView+WebCache.h>
#import "CDVerticalButton.h"

@interface CDMeHeadView()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *timeJoinBtn;
@property (nonatomic, strong) UIButton *followBtn;
@property (nonatomic, strong) UIButton *fansBtn;
@property (nonatomic, strong) UIButton *editProfileBtn;
@property (nonatomic, strong) CDVerticalButton *myFavoriteBtn;
@property (nonatomic, strong) CDVerticalButton *orderBtn;
@property (nonatomic, strong) CDVerticalButton *onSaleBtn;
@property (nonatomic, strong) CDVerticalButton *statisticsBtn;
@property (nonatomic, strong) UIButton *cookbookBtn;
@property (nonatomic, strong) UIButton *productionBtn;
@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UIView *toplineView;
@property (nonatomic, strong) UIView *bottomlineView;
@property (nonatomic, strong) UIView *redBottomAnimationView;

@end


@implementation CDMeHeadView

- (instancetype)init
{
    if (self = [super init]) {
        [self creatUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       [self creatUI];
    }
    return self;
}


- (void)creatUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self nameLabel];
    [self timeJoinBtn];
    [self headImgView];
    [self editProfileBtn];
    [self followBtn];
    [self fansBtn];
    [self myFavoriteBtn];
    [self orderBtn];
    [self onSaleBtn];
    [self statisticsBtn];
    [self cookbookBtn];
    [self productionBtn];
    [self redBottomAnimationView];
}

#pragma mark - Button Click - 

- (void)buttonClickAction:(UIButton *)sender
{
    if (sender.tag == 100) {
        self.cookbookBtn.selected = YES;
        self.productionBtn.selected = NO;
        [UIView animateWithDuration:0.2f animations:^{
            [self.redBottomAnimationView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self);
                make.bottom.equalTo(self).offset(-2);
                make.size.mas_offset(CGSizeMake(CDScreenW / 2, 2));
            }];
            [self layoutIfNeeded];
        }];
    }else if(sender.tag == 200){
        self.cookbookBtn.selected = NO;
        self.productionBtn.selected = YES;
        [UIView animateWithDuration:0.2f animations:^{
            [self.redBottomAnimationView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self);
                make.bottom.equalTo(self).offset(-2);
                make.size.mas_offset(CGSizeMake(CDScreenW / 2, 2));
            }];
            [self layoutIfNeeded];
        }];
    }

    if (self.buttonCickBlock) {
        self.buttonCickBlock(sender.tag, nil);
    }
}

#pragma mark - Lazy Load -

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"bbigcd";
        _nameLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@30);
            make.left.equalTo(@20);
            make.right.lessThanOrEqualTo(@(-120));
        }];
    }
    return _nameLabel;
}

- (UIButton *)timeJoinBtn
{
    if (!_timeJoinBtn) {
        _timeJoinBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"2016 加入" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_timeJoinBtn];
        [_timeJoinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(35);
            make.left.equalTo(@20);
        }];
    }
    return _timeJoinBtn;
}


- (UIImageView *)headImgView
{
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        [self addSubview:_headImgView];
        [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-15));
            make.top.equalTo(@20);
            make.size.mas_offset(CGSizeMake(100, 100));
        }];
        _headImgView.backgroundColor = [UIColor whiteColor];
        _headImgView.layer.cornerRadius = 50.0f;
        _headImgView.layer.masksToBounds = YES;
        [_headImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"feedsNotLogin_320x240_"]];
    }
    return _headImgView;
}


- (UIButton *)editProfileBtn
{
    if (!_editProfileBtn) {
        _editProfileBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"编辑个人资料" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor cd_textColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_editProfileBtn];
        [_editProfileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headImgView.mas_bottom).offset(15);
            make.right.equalTo(@(-15));
            make.width.equalTo(_headImgView.mas_width);
            make.height.equalTo(@40);
        }];
       self.toplineView = [self addLineViewWithMASViewAttribute:_editProfileBtn.mas_bottom withDisValue:15];
    }
    return _editProfileBtn;
}


- (UIButton *)followBtn
{
    if (!_followBtn) {
        _followBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"0\n关注" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_followBtn];
        [_followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_timeJoinBtn.mas_bottom).offset(15);
            make.left.equalTo(@20);
            make.size.mas_offset(CGSizeMake(40, 50));
        }];
    }
    return _followBtn;
}

- (UIButton *)fansBtn
{
    if (!_fansBtn) {
        _fansBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"0\n粉丝" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_fansBtn];
        [_fansBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_timeJoinBtn.mas_bottom).offset(15);
            make.left.equalTo(_followBtn.mas_right).offset(30);
            make.size.mas_offset(CGSizeMake(40, 50));
        }];
    }
    return _fansBtn;
}

- (CDVerticalButton *)myFavoriteBtn
{
    if (!_myFavoriteBtn) {
        _myFavoriteBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"我的收藏" forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"myFavourite_25x25_"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_myFavoriteBtn];
        [_myFavoriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_toplineView.mas_bottom);
            make.left.equalTo(self);
            make.size.mas_offset(CGSizeMake(CDScreenW / 4, 90));
        }];
    }
    return _myFavoriteBtn;
}

- (CDVerticalButton *)orderBtn
{
    if (!_orderBtn) {
        _orderBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"订单" forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"myOrder_25x25_"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_orderBtn];
        [_orderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_toplineView.mas_bottom);
            make.left.equalTo(_myFavoriteBtn.mas_right);
            make.size.equalTo(_myFavoriteBtn);
        }];
    }
    return _orderBtn;
}

- (CDVerticalButton *)onSaleBtn
{
    if (!_onSaleBtn) {
        _onSaleBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"优惠" forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"myVoucher_25x25_"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_onSaleBtn];
        [_onSaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_toplineView.mas_bottom);
            make.left.equalTo(_orderBtn.mas_right);
            make.size.equalTo(_myFavoriteBtn);
        }];
    }
    return _onSaleBtn;
}

- (CDVerticalButton *)statisticsBtn
{
    if (!_statisticsBtn) {
        _statisticsBtn = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"统计" forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"mystats_25x25_"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_statisticsBtn];
        [_statisticsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_toplineView.mas_bottom);
            make.left.equalTo(_onSaleBtn.mas_right);
            make.size.equalTo(_myFavoriteBtn);
        }];
        self.bottomlineView = [self addLineViewWithMASViewAttribute:_statisticsBtn.mas_bottom withDisValue:0];
    }
    return _statisticsBtn;
}

- (UIButton *)cookbookBtn
{
    if (!_cookbookBtn) {
        _cookbookBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:[NSString stringWithFormat:@"菜谱 %@", @"0"] forState:UIControlStateNormal];
            btn.selected = YES;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor cd_textColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 100;
            btn;
        });
        [self addSubview:_cookbookBtn];
        [_cookbookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.top.equalTo(_bottomlineView.mas_bottom);
            make.width.equalTo(@(CDScreenW/2));
            make.bottom.equalTo(@0);
        }];
    }
    return _cookbookBtn;
}

- (UIButton *)productionBtn
{
    if (!_productionBtn) {
        _productionBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:[NSString stringWithFormat:@"作品 %@", @"0"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor cd_textColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 200;
            btn;
        });
        [self addSubview:_productionBtn];
        [_productionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@0);
            make.top.equalTo(_bottomlineView.mas_bottom);
            make.width.equalTo(@(CDScreenW/2));
            make.bottom.equalTo(@0);
        }];

    }
    return _productionBtn;
}

- (UIView *)redBottomAnimationView
{
    if (!_redBottomAnimationView) {
        _redBottomAnimationView = [[UIView alloc] init];
        _redBottomAnimationView.backgroundColor = [UIColor cd_textColor];
        [self addSubview:_redBottomAnimationView];
        [_redBottomAnimationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.bottom.equalTo(self).offset(-2);
            make.size.mas_offset(CGSizeMake(CDScreenW / 2, 2));
        }];
    }
    return _redBottomAnimationView;
}

#pragma mark - Comment Private Function -

- (UIView *)addLineViewWithMASViewAttribute:(MASViewAttribute *)masOfEqualTo withDisValue:(NSInteger)disValue
{
    UIView *lineView =  [[UIView alloc] init];
    lineView.backgroundColor = [UIColor cd_lineViewColor];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(masOfEqualTo).offset(disValue);
        make.left.right.equalTo(self);
        make.size.mas_offset(CGSizeMake(CDScreenW, 1));
    }];
    return lineView;
}

#pragma mark - Animation Func -

@end
