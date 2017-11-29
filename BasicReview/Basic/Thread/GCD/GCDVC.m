//
//  GCDVC.m
//  BasicReview
//
//  Created by near on 2017/11/28.
//  Copyright © 2017年 near. All rights reserved.
//

#import "GCDVC.h"

/**
 总结:
 1. 创建一个非主队列的 gcd 队列实际上就是创建了另外个新的线程了;
 2. 并行队列异步执行创建了新的线程(创建了多条线程)，同步执行没有创建新的线程;
 3. 串行队列异步执行创建了新的线程(好像就创建了一条)，同步执行没有创建新的线程;
 4. 主队列异步同步执行都没有创建新的线程, 并且主队列同步执行会造成线程死锁
 */
@interface GCDVC ()
@property (nonatomic) NSUInteger number;
@property (nonatomic) NSUInteger queueLoopCount;
@end

@implementation GCDVC

static const char * SERIALQUEUENAME = "serial.queue.GCDVC";
static const char * CONCURRENTQUEUENAME = "concurrent.queue.GCDVC";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.number = 10;
    self.queueLoopCount = 3;
    
//    [self mainSync];        // 主队列异步
//    [self mainAsync];       // 主队列同步
//    [self serialAsync];     // 串行队列异步
//    [self serialSync];      // 串行队列同步
//    [self concurrentAsync]; // 并行队列异步
//    [self concurrentSync];  // 并行队列同步
    [self createThread];
}

- (void)createThread {
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(concurrentSync) object:nil];
    [thread start];
}

#pragma mark - main queue
- (void)mainAsync {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"async: %@", [NSThread currentThread]);
    });
    NSLog(@"main: %@", [NSThread currentThread]);
}
- (void)mainSync {
    /// 两者互相等待造成死锁
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"sync: %@", [NSThread currentThread]);
    });
    NSLog(@"main: %@", [NSThread currentThread]);
}

#pragma mark - serial queue

- (void)serialAsync {
    dispatch_queue_t queue = dispatch_queue_create(SERIALQUEUENAME, DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"serial start: %@", [NSThread currentThread]);
    for (NSUInteger a = 0; a < self.queueLoopCount; a++) {
        dispatch_async(queue, ^{
            for (NSUInteger i = self.number * a; i < self.number * (a + 1); i++) {
                NSLog(@"%ld async: %ld \r\n %@", a, i, [NSThread currentThread]);
            }
        });
    }
    NSLog(@"serial end: %@", [NSThread currentThread]);
}
- (void)serialSync {
    dispatch_queue_t queue = dispatch_queue_create(SERIALQUEUENAME, DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"serial start: %@", [NSThread currentThread]);
    for (NSUInteger a = 0; a < self.queueLoopCount; a++) {
        dispatch_async(queue, ^{
            for (NSUInteger i = self.number * a; i < self.number * (a + 1); i++) {
                NSLog(@"%ld sync: %ld \r\n %@", a, i, [NSThread currentThread]);
            }
        });
    }
    NSLog(@"serial end: %@", [NSThread currentThread]);
}

#pragma mark - concurrent queue

- (void)concurrentAsync {
    dispatch_queue_t queue = dispatch_queue_create(CONCURRENTQUEUENAME, DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"concurrent start : %@", [NSThread currentThread]);
    for (NSUInteger a = 0; a < self.queueLoopCount; a++) {
        dispatch_async(queue, ^{
            for (NSUInteger i = self.number * a; i < self.number * (a + 1); i++) {
                NSLog(@"%ld async: %ld \r\n %@", a, i, [NSThread currentThread]);
            }
        });
    }
    
    NSLog(@"concurrent end : %@", [NSThread currentThread]);
}

- (void)concurrentSync {
    dispatch_queue_t queue = dispatch_queue_create(CONCURRENTQUEUENAME, DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"concurrent start : %@", [NSThread currentThread]);
    for (NSUInteger a = 0; a < self.queueLoopCount; a++) {
        dispatch_sync(queue, ^{
            for (NSUInteger i = self.number * a; i < self.number * (a + 1); i++) {
                NSLog(@"%ld sync: %ld \r\n %@", a, i, [NSThread currentThread]);
            }
        });
    }
    
    NSLog(@"concurrent end : %@", [NSThread currentThread]);
}

@end
