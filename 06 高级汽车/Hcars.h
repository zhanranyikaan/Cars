//
//  Hcars.h
//  06 高级汽车
//
//  Created by 栈然亦卡安 on 16/7/18.
//  Copyright © 2016年 栈然亦卡安. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hcars : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carsWithDict:(NSDictionary *)dict;


@end
