//
//  MainViewController.m
//  BasicReview
//
//  Created by near on 2017/11/17.
//  Copyright © 2017年 near. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIButton appearance] setExclusiveTouch:YES];
}

- (NSArray *)array {
    return @[
             @"deepShallowCopy",
             @"messageForward",
             @"runLoop",
             @"lifeCycle",
             @"thread"
             ];
}
- (NSArray *)vcArray {
    return @[
             @"DeepShallowCopyVC",
             @"MessageForwardVC",
             @"RunLoopVC",
             @"LifeCycleVC",
             @"ThreadVC"
             ];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self array] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self array][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
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
@end
