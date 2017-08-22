//
//  CDEventsModel.h
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/22.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDDishesModel;

@interface CDEventsModel : NSObject

@property (nonatomic, copy) NSString *n_dishes;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *customization;
@property (nonatomic, copy) NSArray<CDDishesModel *> *dishes;

@end
