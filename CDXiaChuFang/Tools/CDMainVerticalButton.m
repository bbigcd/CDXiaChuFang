//
//  CDMainVerticalButton.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/22.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMainVerticalButton.h"

@implementation CDMainVerticalButton

- (void)setup
{
    // 去点击高亮
    self.adjustsImageWhenHighlighted = NO;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

// 强制使用initWithFrame初始化
- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
// 在xib中
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

// 重写布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    CGFloat imageViewWidth = 45;
    self.imageView.x = ((CDScreenW / 4) - imageViewWidth) / 2;
    self.imageView.y = self.height * 0.05;
    self.imageView.width = imageViewWidth;
    self.imageView.height = imageViewWidth;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.height * 0.30;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}



@end
