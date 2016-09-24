//
//  Hcars.m
//  06 高级汽车
//
//  Created by 栈然亦卡安 on 16/7/18.
//  Copyright © 2016年 栈然亦卡安. All rights reserved.
//

#import "Hcars.h"

@implementation Hcars
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)carsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
