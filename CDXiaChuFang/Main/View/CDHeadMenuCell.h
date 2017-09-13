//
//  CDHeadMenuCell.h
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/21.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIButtonClickWithTagBlock)(NSInteger tag, id item);

@class Navs;
@interface CDHeadMenuCell : UITableViewCell

@property (nonatomic, copy) UIButtonClickWithTagBlock buttonClickWithTagBlock;

- (void)setNavsWithItem:(NSArray<Navs *> *)navs;

@end
