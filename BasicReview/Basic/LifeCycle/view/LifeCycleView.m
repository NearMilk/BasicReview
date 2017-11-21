//
//  LifeCycleView.m
//  BasicReview
//
//  Created by near on 2017/11/21.
//  Copyright © 2017年 near. All rights reserved.
//

#import "LifeCycleView.h"

/**
 init
     ⬇️
 initWithFrame:
     ⬇️
 willMoveToSuperview:
     ⬇️
 didMoveToSuperview
     ⬇️
 willMoveToWindow:
     ⬇️
 didMoveToWindow
     ⬇️
 layoutSubviews
     ⬇️
 willMoveToWindow:
     ⬇️
 didMoveToWindow
     ⬇️
 removeFromSuperview
     ⬇️
 willMoveToSuperview
     ⬇️
 didMoveToSuperview
     ⬇️
 dealloc
 */
@implementation LifeCycleView

- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"%s", __func__);
    self = [super initWithFrame:frame];
    if (!self) return nil;
    return self;
}
- (instancetype)init {
    NSLog(@"%s", __func__);
    self = [super init];
    if (!self) return nil;
    return self;
}

- (void)layoutSubviews {
    NSLog(@"%s", __func__);
    [super layoutSubviews];
}

- (void)didAddSubview:(UIView *)subview {
    NSLog(@"%s", __func__);
    [super didAddSubview:subview];
}

- (void)willRemoveSubview:(UIView *)subview {
    NSLog(@"%s", __func__);
    [super willRemoveSubview:subview];
}
- (void)willMoveToSuperview:(UIView *)newSuperview {
    NSLog(@"%s", __func__);
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview {
    NSLog(@"%s", __func__);
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    NSLog(@"%s", __func__);
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow {
    NSLog(@"%s", __func__);
    [super didMoveToWindow];
}

- (void)removeFromSuperview {
    NSLog(@"%s", __func__);
    [super removeFromSuperview];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end
