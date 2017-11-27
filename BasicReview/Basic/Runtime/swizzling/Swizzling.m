//
//  Swizzling.m
//  BasicReview
//
//  Created by near on 2017/11/27.
//  Copyright © 2017年 near. All rights reserved.
//

#import "Swizzling.h"
#import <objc/runtime.h>

/**
 资料来源于 http://yulingtianxia.com/blog/2017/04/17/Objective-C-Method-Swizzling/
 */

@implementation Swizzling

+ (void)load {
}

+ (void)programA {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originalSelector = @selector(method_original:);
        SEL swizzledSelector = @selector(method_swizzle:);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(aClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


#pragma mark - static swizzling

typedef IMP *IMPPointer;
static void MethodSwizzle(id self, SEL _cmd, id arg1);
static void (*MethodOriginal)(id self, SEL _cmd, id arg1);

static void MethodSwizzle(id self, SEL _cmd, id arg1) {
    MethodOriginal(self, _cmd, arg1);
}

BOOL class_swizzleMethodAndStore(Class class, SEL original, IMP replacement, IMPPointer store) {
    IMP imp = NULL;
    Method method = class_getInstanceMethod(class, original);
    if (method) {
        const char *type = method_getTypeEncoding(method);
        imp = class_replaceMethod(class, original, replacement, type);
        if (!imp) {
            imp = method_getImplementation(method);
        }
    }
    if (imp && store) {
        *store = imp;
    }
    return (imp != NULL);
}
+ (BOOL)swizzle:(SEL)original with:(IMP)replacement store:(IMPPointer)store {
    return class_swizzleMethodAndStore(self, original, replacement, store);
}
+ (void)staticSwizzling {
    /**
     有时为了避免方法命名冲突和参数 _cmd 被篡改，也会使用下面这种『静态方法版本』的 Method Swizzle。CaptainHook 中的宏定义也是采用这种方式，比较推荐：
     */
    [self swizzle:@selector(method_original:) with:(IMP)MethodSwizzle store:(IMP *)&MethodOriginal];
}

#pragma mark -

+ (void)programB {
    /**
     直接交换 IMP 是很危险的。因为如果这个类中没有实现这个方法，class_getInstanceMethod() 返回的是某个父类的 Method 对象，这样 method_exchangeImplementations() 就把父类的原始实现（IMP）跟这个类的 Swizzle 实现交换了。这样其他父类及其其他子类的方法调用就会出问题，最严重的就是 Crash。
     但如果这个类中实现了此方法，那么方案 A 等价于方案 B
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        
        SEL originalSelector = @selector(method_original:);
        SEL swizzledSelector = @selector(method_swizzle:);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

@end
