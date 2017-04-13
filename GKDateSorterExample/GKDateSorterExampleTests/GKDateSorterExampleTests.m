//
//  GKDateSorterExampleTests.m
//  GKDateSorterExampleTests
//
//  Created by GaoXueKai on 2017/4/13.
//  Copyright © 2017年 GaoXueKai. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "GKDateSorter.h"

@interface GKDateSorterExampleTests : XCTestCase

@end

@implementation GKDateSorterExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [[GKDateSorter appearance] setDefultDateformat:@"yyyy-MM-dd HH:mm:ss"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSorterWithDate {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    GKDateSorter *dataSorter = [[GKDateSorter alloc] initWithDate:[NSDate dateWithTimeIntervalSince1970:0]];
    NSString *year = [dataSorter getYear];
    
    BOOL result = [year isEqualToString:@"1970"];
    
    XCTAssert(result,@"");
}

- (void)testSorterWithString {
    
    GKDateSorter *dataSorter = [[GKDateSorter alloc] initWithDateString:@"2000-12-12 12:12:12"];
    NSString *month = [dataSorter getMonth];
    
    BOOL result = [month isEqualToString:@"12"];
    
    XCTAssert(result,@"");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
