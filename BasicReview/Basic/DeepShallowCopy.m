//
//  DeepShallowCopy.m
//  BasicReview
//
//  Created by near on 2017/11/17.
//  Copyright © 2017年 near. All rights reserved.
//

#import "DeepShallowCopy.h"

@implementation DeepShallowCopy
- (void)testNSString {
    NSString *str1 = @"str1";   // NSString
    NSString *str2 = str1;  // 浅拷贝，NSString
    NSString *str3 = [str1 copy]; // 浅拷贝，NSString
    NSString *str4 = [str1 mutableCopy]; // 深拷贝，NSMutableString
    NSMutableString *msSrr1 = str1; // 浅拷贝，NSString
    NSMutableString *msStr2 = [str1 copy]; // 浅拷贝，NSString
    NSMutableString *msStr3 = [str1 mutableCopy]; // 深拷贝，类型为NSMutableString
    NSLog(@"str1 = %p, str2 = %p, str3 = %p, str4 = %p, msStr1 = %p, , msStr2 = %p, , msStr3 = %p", str1, str2, str3, str4, msSrr1, msStr2, msStr3);
}

- (void)testNSMutableString {
    NSMutableString *msStr1 = [NSMutableString stringWithFormat:@"msStr1"]; // NSMutableString
    NSMutableString *msStr2 = msStr1; // 浅拷贝，NSMutableString
    NSMutableString *msStr3 = [msStr1 copy];  // 深拷贝，NSString
    NSMutableString *msStr4 = [msStr1 mutableCopy];   // 深拷贝，NSMutableString
    NSString *str1 = msStr1;   // 浅拷贝，NSMutableString
    NSString *str2 = [msStr1 copy];    // 深拷贝，NSString
    NSString *str3 = [msStr1 mutableCopy]; // 深拷贝，NSMutableString
    NSLog(@"msSrr1 = %p, msSrr2 = %p, msSrr3 = %p, msSrr4 = %p, str1 = %p, , str2 = %p, , str3 = %p", msStr1, msStr2, msStr3, msStr4, str1, str2, str3);
}

- (void)testNSArray {
    NSString *str = @"str"; // NSString
    NSMutableString *msStr = [NSMutableString stringWithFormat:@"msStr"];   // NSMutableString
    NSArray *arr1 = @[str, msStr];  // NSArray，元素1 NSString，元素2 NSMutableString
    NSArray *arr2 = arr1;   // 容器浅拷贝，NSArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSArray *arr3 = [arr1 copy];    // 容器浅拷贝，NSArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSArray *arr4 = [arr1 mutableCopy]; // 容器深拷贝，NSMutableArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSMutableArray *msArr1 = arr1;  // 容器浅拷贝，NSArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSMutableArray *msArr2 = [arr1 copy];   // 容器浅拷贝，NSArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSMutableArray *msArr3 = [arr1 mutableCopy];    // 容器深拷贝，NSMutableArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    
    NSLog(@"str = %p, msStr = %p, arr1 = %p, arr1[0] = %p, arr1[1] = %p, arr2 = %p, arr2[0] = %p, arr2[1] = %p, arr3 = %p, arr3[0] = %p, arr3[1] = %p, arr4 = %p, arr4[0] = %p, arr4[1] = %p,  msArr1 = %p, msArr1[0] = %p, msArr1[1] = %p, msArr2 = %p, msArr2[0] = %p, msArr2[2] = %p, msArr3 = %p, msArr3[0] = %p, msArr3[1] = %p,  ", str, msStr, arr1, arr1[0], arr1[1], arr2, arr2[0], arr2[1], arr3, arr3[0], arr3[1], arr4, arr4[0], arr4[1], msArr1, msArr1[0], msArr1[1], msArr2, msArr2[0], msArr2[1], msArr3, msArr3[0], msArr3[1]);
}

- (void)testNSMutableArray {
    NSString *str = @"str"; // NSString
    NSMutableString *msStr = [NSMutableString stringWithFormat:@"msStr"];   // NSMutableString
    NSMutableArray *msArr1 = [NSMutableArray arrayWithObjects:str, msStr, nil];  // NSMutableArray，元素1 NSString，元素2 NSMutableString
    NSArray *arr1 = msArr1;   // 容器浅拷贝，NSMutableArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSArray *arr2 = [msArr1 copy];    // 容器深拷贝，NSArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSArray *arr3 = [msArr1 mutableCopy]; // 容器深拷贝，NSMutableArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSMutableArray *msArr2 = msArr1;  // 容器浅拷贝，NSMutableArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSMutableArray *msArr3 = [msArr1 copy];   // 容器深拷贝，NSArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    NSMutableArray *msArr4 = [msArr1 mutableCopy];    // 容器深拷贝，NSMutableArray，数组中元素浅拷贝 元素1 NSString，元素2 NSMutableString
    
    NSLog(@"str = %p, msStr = %p, arr1 = %p, arr1[0] = %p, arr1[1] = %p, arr2 = %p, arr2[0] = %p, arr2[1] = %p, arr3 = %p, arr3[0] = %p, arr3[1] = %p, msArr1 = %p, msArr1[0] = %p, msArr1[1] = %p, msArr2 = %p, msArr2[0] = %p, msArr2[2] = %p, msArr3 = %p, msArr3[0] = %p, msArr3[1] = %p, msArr4 = %p, msArr4[0] = %p, msArr4[1] = %p", str, msStr, arr1, arr1[0], arr1[1], arr2, arr2[0], arr2[1], arr3, arr3[0], arr3[1], msArr1, msArr1[0], msArr1[1], msArr2, msArr2[0], msArr2[1], msArr3, msArr3[0], msArr3[1], msArr4, msArr4[0], msArr4[1]);
}

- (void)testNSDictionary {
    NSString *str = @"str"; // NSString
    NSMutableString *msStr = [NSMutableString stringWithFormat:@"msStr"];   // NSMutableString
    NSDictionary *dict1 = @{@"str": str, @"msStr": msStr};  // NSDictionary，str NSString，msStr NSMutableString
    NSDictionary *dict2 = dict1;    // 容器浅拷贝，NSDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSDictionary *dict3 = [dict1 copy]; // 容器浅拷贝，NSDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSDictionary *dict4 = [dict1 mutableCopy];  // 容器深拷贝，NSMutableDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSMutableDictionary *msDict1 = dict1;   // 容器浅拷贝，NSDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSMutableDictionary *msDict2 = [dict1 copy];    // 容器浅拷贝，NSDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSMutableDictionary *msDict3 = [dict1 mutableCopy]; // 容器深拷贝，NSMutableDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    
    NSLog(@"str = %p, msStr = %p, dict1 = %p, dict1[str] = %p, dict1[msStr] = %p, dict2 = %p, dict2[str] = %p, dict2[msStr] = %p, dict3 = %p, dict3[str] = %p, dict3[msStr] = %p, dict4 = %p, dict4[str] = %p, dict4[msStr] = %p,  msDict1 = %p, msDict1[str] = %p, msDict1[msStr] = %p, msDict2 = %p, msDict2[str] = %p, msDict2[msStr] = %p, msDict3 = %p, msDict3[str] = %p, msDict3[msStr] = %p,  ", str, msStr, dict1, dict1[@"str"], dict1[@"msStr"], dict2, dict2[@"str"], dict2[@"msStr"], dict3, dict3[@"str"], dict3[@"msStr"], dict4, dict4[@"str"], dict4[@"msStr"], msDict1, msDict1[@"str"], msDict1[@"msStr"], msDict2, msDict2[@"str"], msDict2[@"msStr"], msDict3, msDict3[@"str"], msDict3[@"msStr"]);
}

- (void)testNSMutableDictionary {
    NSString *str = @"str"; // NSString
    NSMutableString *msStr = [NSMutableString stringWithFormat:@"msStr"];   // NSMutableString
    //    NSMutableDictionary *msDict1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"str", str, @"msStr", msStr, nil];  // NSMutableDictionary，str NSString，msStr NSString 这种初始化方法好像深拷贝出一份不可变对象，没做过进一步确认
    NSMutableDictionary *msDict1 = [NSMutableDictionary dictionary];    // NSMutableDictionary，str NSString，msStr NSMutableString
    [msDict1 setObject:str forKey:@"str"];
    [msDict1 setObject:msStr forKey:@"msStr"];
    NSDictionary *dict1 = msDict1;    // 容器浅拷贝，NSMutableDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSDictionary *dict2 = [msDict1 copy]; // 容器深拷贝，NSDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSDictionary *dict3 = [msDict1 mutableCopy];  // 容器深拷贝，NSMutableDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSMutableDictionary *msDict2 = msDict1;   // 容器浅拷贝，NSMutableDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSMutableDictionary *msDict3 = [msDict1 copy];    // 容器深拷贝，NSDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    NSMutableDictionary *msDict4 = [msDict1 mutableCopy]; // 容器深拷贝，NSMutableDictionary，字典中元素浅拷贝 str NSString，msStr NSMutableString
    
    NSLog(@"str = %p, msStr = %p, dict1 = %p, dict1[str] = %p, dict1[msStr] = %p, dict2 = %p, dict2[str] = %p, dict2[msStr] = %p, dict3 = %p, dict3[str] = %p, dict3[msStr] = %p, msDict1 = %p, msDict1[str] = %p, msDict1[msStr] = %p, msDict2 = %p, msDict2[str] = %p, msDict2[msStr] = %p, msDict3 = %p, msDict3[str] = %p, msDict3[msStr] = %p, msDict4 = %p, msDict4[str] = %p, msDict4[msStr] = %p  ", str, msStr, dict1, dict1[@"str"], dict1[@"msStr"], dict2, dict2[@"str"], dict2[@"msStr"], dict3, dict3[@"str"], dict3[@"msStr"],msDict1, msDict1[@"str"], msDict1[@"msStr"], msDict2, msDict2[@"str"], msDict2[@"msStr"], msDict3, msDict3[@"str"], msDict3[@"msStr"],  msDict4, msDict4[@"str"], msDict4[@"msStr"]);
}

/// NSSet不试了

- (void)testObject {
    NSObject *obj1 = [[NSObject alloc] init];
    NSObject *obj2 = obj1;  // 内存地址相同
    
    NSLog(@"obj1 = %p, obj2 = %p", obj1, obj2);
}
@end
