//
//  TableDataSourceTemplateTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TableDataSourceTemplate.h"
#import "TableDataSource.h"
#import "NetworkingManager.h"
#import "NetworkingManagerMock.h"
#import "JSONParser.h"
#import "YleJSONParser.h"

@interface TableDataSourceTemplateTests : XCTestCase
@property (strong, nonatomic, readonly) NSData *testData;
@property (strong, nonatomic, readonly) id <NetworkingManager> networkingManagerMock;
@property (strong, nonatomic, readonly) id <JSONParser> parser;
@end

@implementation TableDataSourceTemplateTests

@synthesize testData = _testData;

- (NSData *)testData {
    if(!_testData){
        NSBundle *bundle = [NSBundle bundleForClass:[TableDataSourceTemplateTests class]];
        NSString *path = [bundle pathForResource:@"test" ofType:@"json"];
        _testData = [NSData dataWithContentsOfFile:path];
    }
    return _testData;
}

@synthesize networkingManagerMock = _networkingManagerMock;

- (id <NetworkingManager>)networkingManagerMock {
    if(!_networkingManagerMock){
        _networkingManagerMock = [[NetworkingManagerMock alloc] initWithData:self.testData];
    }
    return _networkingManagerMock;
}

@synthesize parser = _parser;

- (id <JSONParser>)parser {
    if(!_parser){
        _parser = [[YleJSONParser alloc] init];
    }
    return _parser;
}

- (TableDataSourceTemplate *)makeInstanceUnderTestWithComplition:(void (^)(void))complition {
    return [[TableDataSourceTemplate alloc]
                              initWithSearch:@"testSearch"
                              urlMaker:nil
                              parser:self.parser
                              networkManager:self.networkingManagerMock
                              completion:complition];
}

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void) testClassConformsTableDataSourceProtocol {
    XCTAssert([TableDataSourceTemplate conformsToProtocol:@protocol(TableDataSource)]);
}

- (void) testInstanceStartWithNoData {
    // Arrange
    int expectedCount = 0;
    // Act
    TableDataSourceTemplate *templateUnderTest = [self makeInstanceUnderTestWithComplition:^{}];
    // Assert
    XCTAssertEqual(templateUnderTest.count, expectedCount);
}

- (void) testloadDataInAmountReturnsExpectedDaraAmount {
    // Arrange
    int expectedCount = 2;
    XCTestExpectation *expectation = [self expectationWithDescription:@"complition"];
    TableDataSourceTemplate *templateUnderTest = [self makeInstanceUnderTestWithComplition:^{ [expectation fulfill]; }];
    // Act
    [templateUnderTest loadDataInAmount:2];
    [self waitForExpectationsWithTimeout:5 handler:^(NSError * error) { NSLog(@"Error: %@", error); }];
    // Assert
    XCTAssertEqual(templateUnderTest.count, expectedCount);
}

@end
