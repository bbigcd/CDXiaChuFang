//
//  CDMainModel.m
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/31.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "CDMainModel.h"
#import <NSObject+YYModel.h>

@implementation CDMainModel

@end

@implementation Content

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"popEvents":@"pop_events",
             @"popRecipeRicurl":@"pop_recipe_picurl"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"navs":[Navs class]};
}

@end

@implementation PopEvents
+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"navs":[Events class]};
}

@end

@implementation Navs

@end

@implementation Events

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"nDishes":@"n_disher",
             @"kId":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"customization":[Navs class]};
}

@end

@implementation Customization

@end

@implementation Dishes

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"dishes":[InDishes class]};
}

@end

@implementation InDishes

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"thumbNail280":@"thumbnail_280"};
}


@end
