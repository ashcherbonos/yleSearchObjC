//
//  ImageLoaderWithFadeInFactoryTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ImageLoaderWithFadeInFactory.h"
#import "ImageLoader.h"

@interface ImageLoaderWithFadeInFactoryTests : XCTestCase

@end

@implementation ImageLoaderWithFadeInFactoryTests

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void) testClassConformsImageLoaderMakerProtocol {
    XCTAssert([ImageLoaderWithFadeInFactory conformsToProtocol:@protocol(ImageLoaderMaker)]);
}

- (void) testMakeResultConformsImageLoaderProtocol {
    // Arrange
    ImageLoaderWithFadeInFactory *factoryUnderTest = [[ImageLoaderWithFadeInFactory alloc]
                                                    initWithCache:nil networkingManager:nil];
    // Act
    id result = [factoryUnderTest make];
    // Assert
    XCTAssert([result conformsToProtocol:@protocol(ImageLoader)]);
}

- (void) testMakeResultIsMemberOfClassImageLoaderWithFadeIn {
    // Arrange
    ImageLoaderWithFadeInFactory *factoryUnderTest = [[ImageLoaderWithFadeInFactory alloc]
                                                      initWithCache:nil networkingManager:nil];
    // Act
    id result = [factoryUnderTest make];
    // Assert
    XCTAssert([result isMemberOfClass:[ImageLoaderWithFadeIn class]]);
}

@end
