//
//  LifeCycleObject.m
//  BasicReview
//
//  Created by near on 2017/11/21.
//  Copyright © 2017年 near. All rights reserved.
//

#import "LifeCycleObject.h"

@implementation LifeCycleObject

+ (instancetype)new {
    NSLog(@"%s", __func__);
    return [super new];
}

+ (instancetype)alloc {
    NSLog(@"%s", __func__);
    return [super alloc];
}

- (instancetype)init {
    NSLog(@"%s", __func__);
    return [super init];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end
