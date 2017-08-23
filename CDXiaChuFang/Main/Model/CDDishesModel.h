//
//  CDDishesModel.h
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/22.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDDishesArrModel;

@interface CDDishesModel : NSObject

@property (nonatomic, copy) NSArray<CDDishesArrModel *> *dishes;

@end


@interface CDDishesArrModel : NSObject

@property (nonatomic, copy) NSString *thumbnail_280;

@end
