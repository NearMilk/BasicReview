//
//  LifeCycleNoNibVC.m
//  BasicReview
//
//  Created by near on 2017/11/21.
//  Copyright © 2017年 near. All rights reserved.
//

#import "LifeCycleNoNibVC.h"

@interface LifeCycleNoNibVC ()

@end

@implementation LifeCycleNoNibVC

- (instancetype)init {
    NSLog(@"%s", __func__);
    return [super init];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"%s", __func__);
    return [super initWithCoder:aDecoder];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"%s", __func__);
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}
- (void)loadView {
    NSLog(@"%s", __func__);
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%s", __func__);
}

- (void)viewDidLayoutSubviews {
    NSLog(@"%s", __func__);
}


- (void)viewDidUnload {
    [super viewDidUnload];
}
- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%s", __func__);
}


@end
