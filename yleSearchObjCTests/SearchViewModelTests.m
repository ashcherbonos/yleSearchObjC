//
//  SearchViewModelTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SearchViewModel.h"
#import "SearchViewModelDelegateMock.h"
#import "NetworkingManager.h"
#import "NetworkingManagerMock.h"
#import "YleTableDataSourcerFactory.h"
#import "ImageCache.h"
#import "ImageLoaderWithFadeInFactory.h"

@interface SearchViewModelTests : XCTestCase
@property (nonatomic, readonly) NSData *jsonTestData;
@end

@implementation SearchViewModelTests

@synthesize jsonTestData = _jsonTestData;

- (NSData *)jsonTestData {
    if(!_jsonTestData){
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSString *path = [bundle pathForResource:@"test" ofType:@"json"];
        _jsonTestData = [NSData dataWithContentsOfFile:path];
    }
    return _jsonTestData;
}

-(SearchViewModel *) makeSearchViewModelWithDelegate:(id<SearchViewModelDelegate>)delegate {
    NetworkingManagerMock *networkManager = [[NetworkingManagerMock alloc] initWithData:self.jsonTestData];
    YleTableDataSourcerFactory *tableDataSourcerFactory = [[YleTableDataSourcerFactory alloc] initWithNetworkingManager:networkManager];
    ImageCache *cache = [[ImageCache alloc] init];
    ImageLoaderWithFadeInFactory *imageLoaderFactory = [[ImageLoaderWithFadeInFactory alloc]
                                                        initWithCache:cache
                                                        networkingManager:networkManager];
    return [[SearchViewModel alloc]
            initWithDelegate:delegate
            dataSourceFactory:tableDataSourcerFactory
            imageLoaderFactory:imageLoaderFactory
            cache:cache];
}


- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void) testDelegateNotRetained {
    // Arrange
    id<SearchViewModelDelegate> delegate = [[SearchViewModelDelegateMock alloc] init];
    // Act
    SearchViewModel *mvvmUnderTest = [self makeSearchViewModelWithDelegate:delegate];
    delegate = [[SearchViewModelDelegateMock alloc] init];
    // Assert
    XCTAssertNil(mvvmUnderTest.delegate);
}

- (void) testDataCountIsEmptyAtStart{
    // Arrange
    NSInteger expectedDataCount = 0;
    // Act
    SearchViewModel *mvvmUnderTest = [self makeSearchViewModelWithDelegate:[[SearchViewModelDelegateMock alloc] init]];
    NSInteger returnedDataCount = mvvmUnderTest.dataCount;
    // Assert
    XCTAssertEqual(returnedDataCount, expectedDataCount);
}

- (void) testSearchReturnExpectedDataAmount{
    // Arrange
    NSInteger expectedDataCount = 2;
    XCTestExpectation *expectation = [self expectationWithDescription:@"handler executed"];
    SearchViewModelDelegateMock *delegate = [[SearchViewModelDelegateMock alloc] initWithExpectation:expectation];
    SearchViewModel *mvvmUnderTest = [self makeSearchViewModelWithDelegate:delegate];
    // Act
    [mvvmUnderTest searchFor:@"test search string"];
    [self waitForExpectations:@[expectation] timeout:5];
    NSInteger returnedDataCount = mvvmUnderTest.dataCount;
    // Assert
    XCTAssertEqual(returnedDataCount, expectedDataCount);
}

- (void) testLoadMoreDataReturnExpectedDataAmount{
    // Arrange
    NSInteger expectedDataCount = 4;
    XCTestExpectation *firstExpectation = [self expectationWithDescription:@"handler executed once"];
    XCTestExpectation *secondExpectation = [self expectationWithDescription:@"handler executed second time"];
    SearchViewModelDelegateMock *delegateFirst = [[SearchViewModelDelegateMock alloc] initWithExpectation:firstExpectation];
    SearchViewModelDelegateMock *delegateSecond = [[SearchViewModelDelegateMock alloc] initWithExpectation:secondExpectation];
    SearchViewModel *mvvmUnderTest = [self makeSearchViewModelWithDelegate:delegateFirst];
    // Act
    [mvvmUnderTest searchFor:@"test search string"];
    [self waitForExpectations:@[firstExpectation] timeout:5];
    mvvmUnderTest.delegate = delegateSecond;
    [mvvmUnderTest loadMoreData];
    [self waitForExpectations:@[secondExpectation] timeout:5];
    NSInteger returnedDataCount = mvvmUnderTest.dataCount;
    // Assert
    XCTAssertEqual(returnedDataCount, expectedDataCount);
}

- (void) testFillDataConsumer {
    // Arrange
    NSInteger expectedDataCount = 2;
    XCTestExpectation *expectationMVVMLoadData = [self expectationWithDescription:@"MVVM load data"];
    SearchViewModelDelegateMock *delegate = [[SearchViewModelDelegateMock alloc] initWithExpectation:expectationMVVMLoadData];
    SearchViewModel *mvvmUnderTest = [self makeSearchViewModelWithDelegate:delegate];
    XCTestExpectation *expectationDataConsumerFilled = [self expectationWithDescription:@"DataConsumer filled"];
    SearchViewModelDelegateMock *testDataConsumer = [[SearchViewModelDelegateMock alloc] initWithExpectation:expectationDataConsumerFilled];
    // Act
    [mvvmUnderTest searchFor:@"test search string"];
    [self waitForExpectations:@[expectationMVVMLoadData] timeout:5];
    XCTAssertEqual(mvvmUnderTest.dataCount, expectedDataCount);
    [mvvmUnderTest fillConsumer:testDataConsumer withDataIndex:0];
    [self waitForExpectations:@[expectationDataConsumerFilled] timeout:5];
    // Assert
    XCTAssertNotNil(testDataConsumer.filledData);
}

@end
