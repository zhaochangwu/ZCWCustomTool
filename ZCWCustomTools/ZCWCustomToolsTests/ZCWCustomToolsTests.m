//
//  ZCWCustomToolsTests.m
//  ZCWCustomToolsTests
//
//  Created by zhaochangwu on 16/8/11.
//  Copyright © 2016年 zhaochangwu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZCWCounter.h"

@interface ZCWCustomToolsTests : XCTestCase

@end

@implementation ZCWCustomToolsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
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

- (void)testCounter {
    NSInteger number = 60;
    ZCWCounter *counter = [ZCWCounter countDownWithStartNumber:number];
    NSInteger delay = 4;
    [counter startCount];
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    // 经过多少纳秒，由主队列调度任务异步执行
    XCTestExpectation *expectation = [self expectationWithDescription:@"Handler called"];
    dispatch_after(when, dispatch_get_main_queue(), ^ {
        // 延迟操作执行的代码
        [expectation fulfill];
        XCTAssertEqual(counter.currentNumber, number - delay);
    });
    [self waitForExpectationsWithTimeout:number handler:nil];
}

@end
