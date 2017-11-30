//
//  LifeCycleVC.m
//  BasicReview
//
//  Created by near on 2017/11/21.
//  Copyright © 2017年 near. All rights reserved.
//

#import "LifeCycleVC.h"
#import "LifeCycleNibVC.h"
#import "LifeCycleNoNibVC.h"
#import "LifeCycleObject.h"
@interface LifeCycleVC ()
@end

@implementation LifeCycleVC

- (void)ppp {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self testWeakStrongObject];
}

- (void)testWeakStrongObject {  // 猜想集合类型因为也是指针对象，应该是差不多的，区别大概是在于他们各自实现的 NSCopying 等协议吧
    LifeCycleObject *obj0 = [LifeCycleObject new];  /// 默认 __strong
    __weak LifeCycleObject *obj1 = [[LifeCycleObject alloc] init]; /// 在 LifeCycleObject 结束创建后立马执行了 dealloc
    __weak LifeCycleObject *obj2 = obj0;
    NSString *string = obj0.string;
    NSLog(@"%p\r\n, %p", obj0.string, string);
    NSLog(@"%p\r\n, %p\r\n, %p", obj0, obj1, obj2);
    obj0 = nil; // obj0 调用了 dealloc， obj0，obj2 内存都被回收了
    NSLog(@"%p\r\n, %p", obj0, obj2);
    
}
- (void)testObject {
    LifeCycleObject *obj0 = [LifeCycleObject new];
    LifeCycleObject *obj1 = [[LifeCycleObject alloc] init];
    NSLog(@"%p\r\n, %p", obj0, obj1);
    obj1 = obj0;    // obj1 调用了 dealloc
    NSLog(@"%p\r\n, %p", obj0, obj1);
    // 函数结束 obj0 也调用了 dealloc
}

- (NSArray *)array {
    return @[
             @"lifeCycleNibVC",
             @"lifeCycleNoNibVC",
             ];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self array] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self array][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        LifeCycleNibVC *vc = [[LifeCycleNibVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        LifeCycleNoNibVC *vc = [[LifeCycleNoNibVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
