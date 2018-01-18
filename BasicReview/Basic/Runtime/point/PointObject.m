//
//  PointObject.m
//  BasicReview
//
//  Created by near on 2018/1/18.
//  Copyright © 2018年 near. All rights reserved.
//

#import "PointObject.h"

@implementation PointObject

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pointName = @"";
        NSLog(@"PointObject init.");
    }
    return self;
}

- (void)setPointName:(NSString *)pointName {
    _pointName = @"PointObject setter";
    NSLog(@"%@", _pointName);
}
@end
