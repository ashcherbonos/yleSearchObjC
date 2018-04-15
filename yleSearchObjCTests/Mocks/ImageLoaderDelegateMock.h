//
//  ImageLoaderDelegateMock.h
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "ImageLoader.h"

@interface ImageLoaderDelegateMock : NSObject <ImageLoaderDelegate>
-(instancetype)initWithExpectation:(XCTestExpectation *)expectation;
@end
