//
//  NetworkingManagerSharedTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkingManagerShared.h"
#import "NetworkingManager.h"

@interface NetworkingManagerSharedTests : XCTestCase
@end

@implementation NetworkingManagerSharedTests

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void)testClassConformsNetworkingManagerProtocol {
    XCTAssert([NetworkingManagerShared conformsToProtocol:@protocol(NetworkingManager)]);
}

@end
