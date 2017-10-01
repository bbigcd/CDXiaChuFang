//
//  CDMainModel.h
//  CDXiaChuFang
//
//  Created by chendi on 2017/8/31.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Content;

@interface CDMainModel : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) Content *content;

@end

@class PopEvents, Navs;
@interface Content : NSObject

@property (nonatomic, strong) PopEvents *popEvents;
@property (nonatomic, strong) NSArray<Navs *> *navs;
@property (nonatomic, copy) NSString *popRecipeRicurl;

@end

@class Events;
@interface PopEvents : NSObject
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSArray<Events *> *events;
@end


@interface Navs : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *picurl;
@property (nonatomic, copy) NSString *url;

@end


@class Customization, Dishes;
@interface Events : NSObject

@property (nonatomic, assign) NSInteger *nDishes;
@property (nonatomic, copy) NSString *kId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Customization *customization;
@property (nonatomic, strong) Dishes *dishes;

@end


@interface Customization : NSObject

@end

@class InDishes;
@interface Dishes : NSObject

@property (nonatomic, strong) NSArray<InDishes *> *dishes;

@end

@interface InDishes : NSObject

@property (nonatomic, copy) NSString *thumbNail280;

@end


