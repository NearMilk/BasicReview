//
//  ThreadVC.m
//  BasicReview
//
//  Created by near on 2017/11/28.
//  Copyright © 2017年 near. All rights reserved.
//

#import "ThreadVC.h"

@interface ThreadVC ()

@end

@implementation ThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSArray *)array {
    return @[
             @"NSThread",
             @"NSOperation",
             @"gcd",
             ];
}

- (NSArray *)vcArray {
    return @[
             @"NSThreadVC",
             @"NSOperationVC",
             @"GCDVC",
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
    Class class = NSClassFromString([self vcArray][indexPath.row]);
    UIViewController *vc = [[class alloc] init];
    if (vc) {
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.title = [self array][indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/*

 我们共同创建:
 善和爱的世界;
 繁荣与富强的国家;
 公平，公开，公正的社会;
 善心，善念，善行，善为的你我他;
 共知，共享，共创，共赢的伙伴们;
 共建平台，汇聚精英，创造财富，成就同事，服务社会，造福人类的企业生态圈
*/

@end
