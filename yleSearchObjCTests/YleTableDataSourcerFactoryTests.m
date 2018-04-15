//
//  YleTableDataSourcerFactoryTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YleTableDataSourcerFactory.h"
#import "TableDataSourcerMaker.h"
#import "TableDataSource.h"

@interface YleTableDataSourcerFactoryTests : XCTestCase

@end

@implementation YleTableDataSourcerFactoryTests

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void) testClassConformsTableDataSourcerMakerProtocol {
    XCTAssert([YleTableDataSourcerFactory conformsToProtocol:@protocol(TableDataSourcerMaker)]);
}

- (void) testMakeResultConformsTableDataSourceProtocol {
    // Arrange
    YleTableDataSourcerFactory *factoryUnderTest = [[YleTableDataSourcerFactory alloc]
                                                    initWithNetworkingManager:nil];
    // Act
    id result = [factoryUnderTest makeWithQuery:@"test query" completion:^{}];
    // Assert
    XCTAssert([result conformsToProtocol:@protocol(TableDataSource)]);
}

@end
