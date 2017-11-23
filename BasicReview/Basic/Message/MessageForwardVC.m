//
//  MessageForwardVC.m
//  BasicReview
//
//  Created by near on 2017/11/20.
//  Copyright © 2017年 near. All rights reserved.
//

#import "MessageForwardVC.h"
#import "MessageSubClass.h"
#import <objc/runtime.h>

/**
 http://yulingtianxia.com/blog/2014/11/05/objective-c-runtime/ 资料来源
 [receive message]; 实际上是发送一条消息，调用了 objc_msgSend, 这个是一个发送消息的过程，一般有如下几步:
 1. 检测这个 selector 是否需要被忽略。比如 Mac OS X 开发中，因为有垃圾回收机制，所以不会理会 retain，release 这些函数了；
 2. 检测这个 target 是不是 nil 对象。ObjC 允许对一个 nil 对象执行任何一个方法都不会 crash，因为会被忽略掉;
 3. 上面两个通过以后就在类中查找 IMP,先从类的 cache 当中查找，找到了就到对应的函数执行;
 4. 如果 cache 当中找不到就到类的 methods 当中查找;
 5. 找不到就向上往 super 当中查找，也是先往 super 的 cache 查找，然后 methods
*/
@interface MessageForwardVC ()

@end

@implementation MessageForwardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MessageSubClass *sub = [MessageSubClass new];
    [sub testMessageForward];
    
}

@end
