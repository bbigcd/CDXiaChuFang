//
//  CDEventsModel.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/22.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDEventsModel.h"
#import "CDDishesModel.h"
#import <NSObject+YYModel.h>

@implementation CDEventsModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"kId":@"id"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
             @"dishes":[CDDishesModel class]
             };
}

@end
