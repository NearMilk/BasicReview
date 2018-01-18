//
//  BasicReviewTests.m
//  BasicReviewTests
//
//  Created by near on 2018/1/17.
//  Copyright © 2018年 near. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PropertiesAttribute.h"
#import "PointSubObject.h"

@interface BasicReviewTests : XCTestCase

@property (nonatomic, strong) PropertiesAttribute *propertiesAttribute;
@property (nonatomic, strong) PointSubObject *pointSubObject;
@end

@implementation BasicReviewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
//    self.propertiesAttribute = [[PropertiesAttribute alloc] init];
    self.pointSubObject = [[PointSubObject alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
