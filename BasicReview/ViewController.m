//
//  ViewController.m
//  BasicReview
//
//  Created by near on 2017/11/17.
//  Copyright © 2017年 near. All rights reserved.
//

#import "ViewController.h"
#import "MessageSubClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MessageSubClass *message = [MessageSubClass new];
    [message testIsExecuteCache];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
