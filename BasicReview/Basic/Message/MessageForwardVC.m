//
//  MessageForwardVC.m
//  BasicReview
//
//  Created by near on 2017/11/20.
//  Copyright © 2017年 near. All rights reserved.
//

#import "MessageForwardVC.h"
#import "MessageSubClass.h"


/**
 [receive message]; 实际上是发送一条消息，调用了 objc_msgSend, 这个是一个发送消息的过程，一般有如下几步:
 1. 检测这个 selector 是否需要被忽略。比如 Mac OS X 开发中，因为有垃圾回收机制，所以不会理会 retain，release 这些函数了；
 2. 检测这个 target 是不是 nil 对象。ObjC 允许对一个 nil 对象执行任何一个方法都不会 crash，因为会被忽略掉;
*/
@interface MessageForwardVC ()

@end

@implementation MessageForwardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MessageSubClass *sub = [MessageSubClass new];
    [sub testIsExecuteCache];
}

@end
