//
//  MessageSubClass.m
//  BasicReview
//
//  Created by near on 2017/11/17.
//  Copyright © 2017年 near. All rights reserved.
//

#import "MessageSubClass.h"
#import "MessageOtherClass.h"
#import <objc/runtime.h>


/**
 总结:
 1. 当没有找到一个需要调用的函数时(我试了下，好像是没有找到指定sel的 imp 的时候才会进行消息转发，不知道有没有搞错.)，会首先调用 resolveInstanceMethod: 或 resolveClassMethod:，我们可以在这一步动态添加一个 imp 避免异常抛出;
 2. 当你在之前一步当中没 hook，会跳到 forwardingTargetForSelector: 中，你可以在这里把这个消息转发给其他对象，让其他对象处理这个消息, 其他对象中必须存在 指定sel的imp
 3. 在上一步也没有 hook 时，会进入 methodSignatureForSelector:，这一步是最后一次挽救的机会，如果该方法返回 nil， 会发送 doesNotRecognizeSelector: 消息，程序也就 crash 了。如果返回了一个函数签名，就会创建一个 NSInvocation 对并且发送 forwardInvocation: 给目标对象, 你可以在其中发送 invokeWithTarget: 消息手动转发或者调用 doesNotRecognizeSelector: 抛出异常。
 */

@implementation MessageSubClass

- (void)testMessageForward {
//    [self performSelector:@selector(xxx)];
    [self performSelector:@selector(xxx)];
//    [MessageSubClass performSelector:@selector(ppp)];
//    [self respondsToSelector:@selector(xxx)];
}


//- (IMP)methodForSelector:(SEL)aSelector {
//    return [super methodForSelector:aSelector];
//}
+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return [super resolveClassMethod:sel];
}
- (void)resolveInstanceMethodIntercept {
    NSLog(@"%@ 拦截了！", NSStringFromSelector(_cmd));
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%@", NSStringFromSelector(_cmd));
//    if (sel == @selector(xxx)) {
//        Method m = class_getInstanceMethod([self class], @selector(resolveInstanceMethodIntercept));
//        if (m) {
//            BOOL isAddSuccess = class_addMethod([self class], sel, method_getImplementation(m), method_getTypeEncoding(m));
//            if (isAddSuccess) {
//                return YES;
//            }
//        }
//
//        return YES;
//    }
    
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(_cmd));
//    if (aSelector == @selector(xxx)) {
//        return [MessageOtherClass new];
//    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
//    if (!methodSignature) {
//        methodSignature = [[MessageOtherClass new] methodSignatureForSelector:aSelector];
//    }
    return methodSignature;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(_cmd)); /// 苹果官方提出 “一定不能让这个函数直接结束掉，必须抛出异常”
    [super doesNotRecognizeSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@", NSStringFromSelector(_cmd));
//    if ([[MessageOtherClass new] respondsToSelector:[anInvocation selector]]) {
//        [anInvocation invokeWithTarget:[MessageOtherClass new]];
//    } else [super forwardInvocation:anInvocation];
    [super forwardInvocation:anInvocation];
}

@end
