//
//  HcarGroups.h
//  06 高级汽车
//
//  Created by 栈然亦卡安 on 16/7/18.
//  Copyright © 2016年 栈然亦卡安. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HcarGroups : NSObject
@property (nonatomic,strong) NSArray *cars;
@property (nonatomic,copy) NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end
