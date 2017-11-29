//
//  NSThreadVC.m
//  BasicReview
//
//  Created by near on 2017/11/28.
//  Copyright © 2017年 near. All rights reserved.
//

#import "NSThreadVC.h"
#import "NSThreadCustom.h"
#import "NSThreadTestClass.h"

/**
 总结:
 1. performSelector 默认是在当前线程执行指定任务，除了个别的指定线程的 performSelector(不用调用start);
 2. NSThread 的初始化方法会创建新的线程，除了一些用方法返回的([NSThread currentThread] 等)
 3. +detachNewThreadSelector 和 +detachNewThreadWithBlock 看字面意思就应该知道是创建了新的线程
 */
@interface NSThreadVC ()
@property (nonatomic, strong) NSThreadCustom *thread;
@property (nonatomic) BOOL isCancel;
@end

@implementation NSThreadVC


//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSThreadWillExitNotification object:nil];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(threadExit) name:NSThreadWillExitNotification object:nil];
    [self perform];
}

- (void)threadExit {
    NSLog(@"%@", [NSThread currentThread]);
    NSLog(@"exit");
}

- (void)perform {
    self.thread = [NSThreadCustom new];
//    self.thread = [[NSThreadCustom alloc] initWithTarget:self selector:@selector(run) object:nil];
//    self.thread = [[NSThreadCustom alloc] initWithBlock:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    }];
    [self.thread start];
//    [self performSelector:@selector(run)];
//    [self performSelector:@selector(run:) withObject:@2];
//    [self performSelector:@selector(run) withObject:@2 withObject:nil];
//    [self performSelector:@selector(run:) withObject:@2 afterDelay:2];
//    [self performSelectorOnMainThread:@selector(run:) withObject:@2 waitUntilDone:YES];
//    [self performSelectorInBackground:@selector(run:) withObject:nil];
//    [self performSelector:@selector(run:) onThread:self.thread withObject:nil waitUntilDone:YES];  // runloop的不想试了
//    [NSThread detachNewThreadWithBlock:^{
//        NSLog(@"%@", [NSThread currentThread]);
//    }];
//    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
    NSLog(@"perform");
}

- (void)btnAction {
    self.isCancel = YES;
    NSLog(@"touch!");
    NSLog(@"%@", self.thread);
    
}
- (void)run {
//    NSLog(@"run!");
//    [NSThread exit]; 退出当前线程
    NSLog(@"run:%@", [NSThread currentThread]);
//    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
//    [currentRunLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//    while (!self.isCancel) {
//    }
    
}

- (void)run:(id)obj {
//    NSLog(@"run! \r\n obj = %@", obj);
    NSLog(@"run: = %@", [NSThread currentThread]);
//    self.isCancel = YES;

}

- (void)run:(id)obj1 obj2:(id)obj2 {
    NSLog(@"run! \r\n obj1 = %@ \r\n obj2 = %@", obj1, obj2);
    NSLog(@"%@", [NSThread currentThread]);
}
@end
