//
//  AssociatedObjectClass.m
//  BasicReview
//
//  Created by near on 2018/1/18.
//  Copyright © 2018年 near. All rights reserved.
//

#import "AssociatedObjectClass.h"
#import <objc/runtime.h>

@interface AssociatedObjectClass ()


@end

@implementation AssociatedObjectClass

- (void)setObject:(NSObject *)object {
    objc_setAssociatedObject(self, "object", object, OBJC_ASSOCIATION_ASSIGN);
    
}
@end
