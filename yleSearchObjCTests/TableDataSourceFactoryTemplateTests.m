//
//  TableDataSourceFactoryTemplateTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TableDataSourceFactoryTemplate.h"
#import "TableDataSourcerMaker.h"
#import "TableDataSource.h"

@interface TableDataSourceFactoryTemplateTests : XCTestCase
@end

@implementation TableDataSourceFactoryTemplateTests

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void)testClassConformsTableDataSourcerMakerProtocol {
    XCTAssert([TableDataSourceFactoryTemplate conformsToProtocol:@protocol(TableDataSourcerMaker)]);
}

- (void)testMakeResultConformsTableDataSourceProtocol {
    // Arrange
    TableDataSourceFactoryTemplate *factoryUnderTest = [[TableDataSourceFactoryTemplate alloc] initWithURLMaker:nil
                                                                                                         parser:nil
                                                                                                 networkManager:nil];
    // Act
    id result = [factoryUnderTest makeWithQuery:@"test query" completion:^{}];
    // Assert
    XCTAssert([result conformsToProtocol:@protocol(TableDataSource)]);
}

@end
