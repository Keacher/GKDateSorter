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
    
    GKDateSorter *dateSorter = [[GKDateSorter alloc] initWithDateString:@"2000-12-12 12:12:12"];
    NSString *month = [dateSorter getMonth];
    
    BOOL result = [month isEqualToString:@"12"];
    
    XCTAssert(result,@"");
}

- (void)testXingqi {
    
    GKDateSorter *dateSorter = [[GKDateSorter alloc] initWithDateString:@"2017>4<14 12#12#12" dateFormat:@"yyyy>MM<dd HH#mm#ss"];
    //2017 - 4 - 14 是周五
    
    NSString *zhou = [dateSorter getWeekDay_Zhou];
    
    NSString *xingqi = [dateSorter getWeekDay_XingQi];
    
    NSString *customPrefix = [dateSorter getWeekDayWithPrefix:@"一星期的某天"];
    
    XCTAssert([zhou isEqualToString:@"周五"],@"周");
    XCTAssert([xingqi isEqualToString:@"星期五"],@"星期");
    XCTAssert([customPrefix isEqualToString:@"一星期的某天五"],@"一星期的某天");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
