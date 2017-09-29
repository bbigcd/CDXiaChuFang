//
//  CDMessageView.h
//  CDXiaChuFang
//
//  Created by chendi on 2017/9/11.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SubscriptionBtnClickBlock)(void);

@interface CDMessageView : UIView

@property (nonatomic, copy) SubscriptionBtnClickBlock subscriptionBtnClickBlock;

@end
