//
//  CDHeadMenuCell+ConfigureForMemuCell.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/2.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDHeadMenuCell+ConfigureForMemuCell.h"
#import <UIButton+WebCache.h>
@implementation CDHeadMenuCell (ConfigureForMemuCell)

- (void)configureForNavs:(NSArray<Navs *> *)navs
{
    [self.btn1 setTitle:navs[0].name forState:UIControlStateNormal];
    [self.btn1 sd_setImageWithURL:[NSURL URLWithString:navs[0].url] forState:UIControlStateNormal];
}

@end
