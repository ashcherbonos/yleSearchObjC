//
//  YleURLMakerTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YleURLMaker.h"
#import "URLMaker.h"
#import "AppConstants.h"

@interface YleURLMakerTests : XCTestCase
@end

@implementation YleURLMakerTests

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void)testClassConformsURLMakerProtocol {
    XCTAssert([YleURLMaker conformsToProtocol:@protocol(URLMaker)]);
}

- (void)testMakeUrlFromQueryReturnsExpectedURL {
    // Arrange
    NSString *query = @"testSearch";
    NSUInteger offset = 1;
    NSUInteger limit = 2;
    // Act
    YleURLMaker *makerUnderTest = [[YleURLMaker alloc] init];
    NSURL *resultURL = [makerUnderTest makeUrlFromQuery:query offset:offset limit:limit];
    // Assert
    NSString *expectedURLstring = [NSString stringWithFormat: @"https://external.api.yle.fi/v1/programs/items.json?offset=1&limit=2&q=testSearch&app_id=%@&app_key=%@", YLE_APP_ID, YLE_APP_KEY];
    XCTAssert([[resultURL absoluteString] isEqualToString:expectedURLstring]);
}

@end
