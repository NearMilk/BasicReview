//
//  PropertiesAttribute.m
//  BasicReview
//
//  Created by near on 2018/1/17.
//  Copyright © 2018年 near. All rights reserved.
//

#import "PropertiesAttribute.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

typedef void (^Block)(void);

@interface PropertiesAttribute ()

@property (nonatomic, readonly, strong) NSString *string;
@property (atomic, readwrite, copy, nullable) NSString *writeString;

@property (nonatomic, assign) CGFloat propertyFloat;

@property (nonatomic, strong) NSValue *rect;

@property (nonatomic, weak) Block block;
@end

@implementation PropertiesAttribute

- (instancetype)init {
    if (self = [super init]) {
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
        for (unsigned int i = 0; i < outCount; i++) {
            property_getAttributes(properties[i]);
            NSLog(@"%s", property_getAttributes(properties[i]));
           
        }
//        class_getProperty(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>)
//        property_getAttributes(<#objc_property_t  _Nonnull property#>)
    }
    return self;
}
@end
