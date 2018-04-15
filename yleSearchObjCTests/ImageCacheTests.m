//
//  ImageCacheTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ImageCache.h"
#import "ImageCacher.h"

@interface ImageCacheTests : XCTestCase
@property (strong, nonatomic, readonly) UIImage *testImage;
@end

@implementation ImageCacheTests

@synthesize testImage = _testImage;

- (UIImage *)testImage {
    if(!_testImage){
        _testImage = [UIImage imageNamed:@"testImage.png"
                                inBundle:[NSBundle bundleForClass:[ImageCacheTests class]]
           compatibleWithTraitCollection:nil];
    }
    return _testImage;
}

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void)testClassConformsTableDataSourcerMakerProtocol {
    XCTAssert([ImageCache conformsToProtocol:@protocol(ImageCacher)]);
}

- (void)testImageCacheStoreUIImage {
    // Arrange
    ImageCache *cacheUnderTest = [[ImageCache alloc] init];
    NSURL *url = [NSURL URLWithString:@"testUrlString"];
    // Act
    cacheUnderTest[url] = self.testImage;
    // Assert
    XCTAssertNotNil(cacheUnderTest[url]);
    XCTAssertEqual(cacheUnderTest[url], self.testImage);
}

- (void)testEmptyDeleteAllCache {
    // Arrange
    ImageCache *cacheUnderTest = [[ImageCache alloc] init];
    NSURL *url = [NSURL URLWithString:@"testUrlString"];
    cacheUnderTest[url] = self.testImage;
    // Act
    [cacheUnderTest empty];
    // Assert
    XCTAssertNil(cacheUnderTest[url]);
}

@end
