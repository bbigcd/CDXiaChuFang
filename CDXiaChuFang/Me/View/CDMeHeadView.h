//
//  CDMeHeadView.h
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/4.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIButtonClickWithTagBlock)(NSInteger tag, id item);

@interface CDMeHeadView : UIView

@property (nonatomic, copy) NSString *headIconUrl;

@property (nonatomic, copy) UIButtonClickWithTagBlock buttonCickBlock;


@end
