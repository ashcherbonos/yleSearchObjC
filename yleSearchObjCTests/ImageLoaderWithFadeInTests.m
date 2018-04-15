//
//  ImageLoaderWithFadeInTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ImageLoaderWithFadeIn.h"
#import "ImageLoader.h"
#import "ImageLoaderDelegateMock.h"
#import "NetworkingManager.h"
#import "NetworkingManagerMock.h"

@interface ImageLoaderWithFadeInTests : XCTestCase
@end

@implementation ImageLoaderWithFadeInTests


- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void) testClassConformsImageLoaderProtocol {
    XCTAssert([ImageLoaderWithFadeIn conformsToProtocol:@protocol(ImageLoader)]);
}

- (void) testDelegateNotRetained {
    // Arrange
    id <ImageLoaderDelegate> delegate = [[ImageLoaderDelegateMock alloc] init];
    ImageLoaderWithFadeIn *loadernUnderTest = [[ImageLoaderWithFadeIn alloc] initWithCache:nil
                                                                         networkingManager:nil];
    // Act
    loadernUnderTest.delegate = delegate;
    delegate = [[ImageLoaderDelegateMock alloc] init];
    // Assert
    XCTAssertNil(loadernUnderTest.delegate);
}

- (void) testMakeStubSetImageIntoImageView {
    // Arrange
    ImageLoaderWithFadeIn *loadernUnderTest = [[ImageLoaderWithFadeIn alloc] initWithCache:nil
                                                                         networkingManager:nil];
    UIImageView *imageView = [[UIImageView alloc] init];
    // Act
    [loadernUnderTest makeStubFor:imageView
                        withLabel:@"A"];
    // Assert
    XCTAssertNotNil(imageView.image);
}

- (void) testLoadSetImageIntoImageView {
    // Arrange
    XCTestExpectation *expectation = [self expectationWithDescription:@"complition"];
    id <ImageLoaderDelegate> delegate = [[ImageLoaderDelegateMock alloc] initWithExpectation:expectation];
    UIImage *image = [UIImage
                      imageNamed:@"testImage.png"
                      inBundle:[NSBundle bundleForClass:[self class]]
                      compatibleWithTraitCollection:nil];
    NSData *expectedImageData = UIImagePNGRepresentation(image);
    id <NetworkingManager> networkingManagerMock = [[NetworkingManagerMock alloc] initWithData:expectedImageData];
    ImageLoaderWithFadeIn *loadernUnderTest = [[ImageLoaderWithFadeIn alloc] initWithCache:nil
                                                                         networkingManager:networkingManagerMock];
    UIImageView *imageView = [[UIImageView alloc] init];
    NSURL *url = [NSURL URLWithString:@"testUrlString"];
    // Act
    loadernUnderTest.delegate = delegate;
    [loadernUnderTest loadURL:url
                intoImageView:imageView];
    // Assert
    [self waitForExpectations:@[expectation] timeout:5];
    XCTAssertNotNil(imageView.image);
    NSData *resultImageData = UIImagePNGRepresentation(imageView.image);
    XCTAssert([resultImageData isEqualToData:expectedImageData]);
}

@end
