//
//  RunLoopVC.m
//  BasicReview
//
//  Created by near on 2017/11/20.
//  Copyright © 2017年 near. All rights reserved.
//

#import "RunLoopVC.h"
#import <mach/message.h>

@interface RunLoopVC ()

@end

@implementation RunLoopVC

static const NSInteger AddDataCount = 10000000;
- (void)viewDidLoad {
    [super viewDidLoad];
//    __block NSInteger i = 0;
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%ld", i++);
//    }];
    [self subRunLoopTimer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self imitateReloadData];
}

- (void)subRunLoopTimer {
//    CFRunLoopRef *subRunLoop = CFRunLoopGetCurrent();
    NSOperationQueue *subRunLoopTimerQueue = [[NSOperationQueue alloc] init];
    __block NSInteger i = 0;
//    subRunLoopTimerQueue
    NSOperation *operation = [[NSOperation alloc] init];
    
    [subRunLoopTimerQueue addOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
        [[NSRunLoop currentRunLoop] run];
//        CFRunLoopRef *subRunLoop = CFRunLoopGetCurrent();
//
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 1.0 * NSEC_PER_SEC);
//        dispatch_source_set_event_handler(timer, ^{
//            i += 1;
//            NSLog(@"%ld", i);
//            if (i > 5) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    NSLog(@"%ld", i);
//                });
//            }
//        });
//        dispatch_resume(timer);
        [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"%@",[NSThread currentThread]);
            NSLog(@"%ld", i++);
        }];
    }];
}

- (void)blockMainLoop {
    [[NSRunLoop mainRunLoop] run];
    /*
     应该是主线程的Runloop在程序刚启动时已经加锁启动进入循环了，而你之后再让主线程的Runloop进入循环就会因为互斥锁而进入睡眠 (来源于 https://blog.ibireme.com/2015/05/18/runloop/ 评论)
     */
}

- (void)imitateReloadData {
        NSMutableArray *array = [NSMutableArray array];
        for (NSInteger i = 0; i < AddDataCount; i++) {
            [array addObject:@(i)];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"reload dat success!");
        });
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < AddDataCount; i++) {
        [array addObject:@(i)];
        //        NSLog(@"%ld", i);
    }
}
@end
