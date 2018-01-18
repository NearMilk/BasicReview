//
//  PointSubObject.m
//  BasicReview
//
//  Created by near on 2018/1/18.
//  Copyright © 2018年 near. All rights reserved.
//

#import "PointSubObject.h"


@implementation PointSubObject
@synthesize pointName = _pointName;

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"PointSubObject init");
    }
    
    return self;
}
- (void)setPointName:(NSString *)pointName {
    _pointName = @"PointSubObject setter";
    NSLog(@"%@", _pointName);
}
@end
