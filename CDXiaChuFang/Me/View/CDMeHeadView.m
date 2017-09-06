//
//  CDMeHeadView.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/4.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMeHeadView.h"
#import <UIImageView+WebCache.h>

@interface CDMeHeadView()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *timeJoinBtn;
@property (nonatomic, strong) UIButton *followBtn;
@property (nonatomic, strong) UIButton *fansBtn;
@property (nonatomic, strong) UIButton *editProfileBtn;
@property (nonatomic, strong) UIImageView *headImgView;

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
    [self followBtn];
    [self fansBtn];
    [self editProfileBtn];
}

#pragma mark - lazy load -

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

- (UIButton *)followBtn
{
    if (!_followBtn) {
        _followBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [btn setTitle:@"2016 加入" forState:UIControlStateNormal];
            btn;
        });
    }
    return _followBtn;
}

- (UIButton *)fansBtn
{
    if (!_fansBtn) {
        _fansBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [btn setTitle:@"2016 加入" forState:UIControlStateNormal];
            btn;
        });
    }
    return _fansBtn;
}

- (UIButton *)editProfileBtn
{
    if (!_editProfileBtn) {
        _editProfileBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"编辑个人资料" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor cd_textColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            btn;
        });
        [self addSubview:_editProfileBtn];
        [_editProfileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headImgView.mas_bottom).offset(33);
            make.right.equalTo(@(-15));
            make.width.equalTo(_headImgView.mas_width);
        }];
        UIView *lineView = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor cd_lineViewColor];
            view;
        });
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_editProfileBtn.mas_bottom).offset(20);
            make.left.right.equalTo(self);
            make.size.mas_offset(CGSizeMake(CDScreenW, 1));
        }];
    }
    return _editProfileBtn;
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

@end
