//
//  MessageForwardVC.m
//  BasicReview
//
//  Created by near on 2017/11/20.
//  Copyright © 2017年 near. All rights reserved.
//

#import "MessageForwardVC.h"
#import "MessageSubClass.h"
@interface MessageForwardVC ()

@end

@implementation MessageForwardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MessageSubClass *sub = [MessageSubClass new];
    [sub testIsExecuteCache];
}

@end
