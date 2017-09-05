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
    self.backgroundColor = [UIColor grayColor];
    [self nameLabel];
    [self addSubview:self.timeJoinBtn];
    [self addSubview:self.headImgView];
    [self addSubview:self.followBtn];
    [self addSubview:self.fansBtn];
    [self addSubview:self.editProfileBtn];
}

#pragma mark - lazy load -

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"bbigcd";
        _nameLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:self.nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@30);
            make.left.equalTo(@20);
        }];
    }
    return _nameLabel;
}

- (UIButton *)timeJoinBtn
{
    if (!_timeJoinBtn) {
        _timeJoinBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            btn;
        });
    }
    return _timeJoinBtn;
}

- (UIButton *)followBtn
{
    if (!_followBtn) {
        _followBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
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
            
            btn;
        });
    }
    return _editProfileBtn;
}

- (UIImageView *)headImgView
{
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        [_headImgView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:nil];
    }
    return _headImgView;
}

@end
