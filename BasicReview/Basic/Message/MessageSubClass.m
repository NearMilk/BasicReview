//
//  MessageSubClass.m
//  BasicReview
//
//  Created by near on 2017/11/17.
//  Copyright © 2017年 near. All rights reserved.
//

#import "MessageSubClass.h"

@implementation MessageSubClass

- (void)testMessageForward {
//    [self performSelector:@selector(xxx)];
    [self methodForSelector:@selector(xxx)];
//    [self respondsToSelector:@selector(xxx)];
}


- (IMP)methodForSelector:(SEL)aSelector {
    return [super methodForSelector:aSelector];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    if ([self respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self];
    } else [super forwardInvocation:anInvocation];
}
@end
