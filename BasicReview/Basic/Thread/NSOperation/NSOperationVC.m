//
//  NSOperationVC.m
//  BasicReview
//
//  Created by near on 2017/11/28.
//  Copyright © 2017年 near. All rights reserved.
//

#import "NSOperationVC.h"
#import "NSOperationCustom.h"
/**
 总结:
 1. NSInvocationOperation 和 NSBlockOperation 初始化默认不创建新的线程，在当前线程执行任务;
 2. 自定义 NSOperation 一般不会创建新的线程，除非自己做了相关操作;
 3. 添加到 NSOperationQueue 的 -addOperation: 中的 NSOperation 自动调用start。 -addOperationWithBlock 相当于添加一次任务，多次调用 -addOperationWithBlock 才能触发并行，只在一个 -addOperationWithBlock 中添加多个任务不能达到需求;
 4. 如果两个 NSOperation 之间有依赖关系，completionBlock 只能代表该 NSOperation 中的任务已经执行完毕，completionBlock 不一定会在后一个 NSOperation 之前执行;
 note: NSBlockOperation 的 addExecutionBlock 会把任务放于其他线程执行，但是不代表一定会创建新的线程。
       addDependency 要在添加到队列之前。
 */
@interface NSOperationVC ()
@property (nonatomic) BOOL isExit;
@end

@implementation NSOperationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createThread];
    [self defaultNSOperation];
//    [self customOperation];
}

- (void)createThread {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [thread start];
}

- (void)customOperation {
    NSOperationCustom *customOperation = [[NSOperationCustom alloc] init];
    
    [customOperation start];
}

- (void)defaultNSOperation {
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];

//    [invocationOperation start];
//
    NSBlockOperation *blockOperation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"block 1 = %@", [NSThread currentThread]);
    }];
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@", [NSThread currentThread]);
    }];
    
    int number = 2;
    for (int i = 0; i < number; i++) {
        [blockOperation addExecutionBlock:^{
            NSLog(@"%d: %@", i, [NSThread currentThread]);
//            [self customOperation];
        }];
        [blockOperation1 addExecutionBlock:^{
            NSLog(@"%d: %@", i + 4, [NSThread currentThread]);
            //            [self customOperation];
        }];

    }
    
//    blockOperation.completionBlock = ^{
//        NSLog(@"blockOperation complete!");
//    };
//
//    blockOperation1.completionBlock = ^{
//        NSLog(@"blockOperation1 complete!");
//    };
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    queue.maxConcurrentOperationCount = 1;
//    [queue addOperationWithBlock:^{
//
//        for (int a = 0; a < 10; a++) {
//            NSLog(@"%d", a);
//        }
//
//
//        [blockOperation start];
//    }];
//    [queue addOperationWithBlock:^{
//        [invocationOperation start];
//        for (int a = 90; a < 100; a++) {
//            NSLog(@"%d", a);
//        }
//    }];
    [blockOperation addDependency:blockOperation1];
    [queue addOperation:blockOperation1];
    [queue addOperation:blockOperation];
    [queue addOperation:invocationOperation];
    
    
//    [blockOperation start];
}

//- (void)exitRunLoop {
//    self.isExit = YES;
//}
- (void)run {
    NSLog(@"run:%@", [NSThread currentThread]);
//    [self defaultNSOperation];
}

- (void)run:(id)obj {
    //    NSLog(@"run! \r\n obj = %@", obj);
    NSLog(@"run: = %@", [NSThread currentThread]);
}


- (void)run:(id)obj1 obj2:(id)obj2 {
    NSLog(@"run! \r\n obj1 = %@ \r\n obj2 = %@", obj1, obj2);
    NSLog(@"%@", [NSThread currentThread]);
}
@end
