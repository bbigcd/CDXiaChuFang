//
//  CDHeadMenuCell.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/21.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDHeadMenuCell.h"
#import "CDVerticalButton.h"

@interface CDHeadMenuCell()

@property (nonatomic, strong) CDVerticalButton *btn1;
@property (nonatomic, strong) CDVerticalButton *btn2;
@property (nonatomic, strong) CDVerticalButton *btn3;
@property (nonatomic, strong) CDVerticalButton *btn4;

@end

@implementation CDHeadMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)buttonClickAction:(UIButton *)sender
{
    if (self.buttonClickWithTagBlock) {
        self.buttonClickWithTagBlock(sender.tag, nil);
    }
}

- (void)setNavsWithItem:(NSArray<Navs *> *)navs
{
    
}

#pragma mark - lazy load -

- (UIButton *)btn1
{
    if (!_btn1) {
        _btn1 = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];
            [btn setTitle:@"" forState:UIControlStateNormal];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _btn1;
}

- (UIButton *)btn2
{
    if (!_btn2) {
        _btn2 = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"" forState:UIControlStateNormal];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _btn2;
}

- (UIButton *)btn3
{
    if (!_btn3) {
        _btn3 = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"" forState:UIControlStateNormal];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_btn3];
        [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _btn3;
}

- (UIButton *)btn4
{
    if (!_btn4) {
        _btn4 = ({
            CDVerticalButton *btn = [[CDVerticalButton alloc] init];;
            [btn setTitle:@"" forState:UIControlStateNormal];
            [btn setImage:nil forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self addSubview:_btn4];
        [_btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _btn4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
