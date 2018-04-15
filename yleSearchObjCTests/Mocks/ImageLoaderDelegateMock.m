//
//  ImageLoaderDelegateMock.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "ImageLoaderDelegateMock.h"

@interface ImageLoaderDelegateMock()
@property (strong, nonatomic, readonly) XCTestExpectation *expectation;
@end

@implementation ImageLoaderDelegateMock

-(instancetype)initWithExpectation:(XCTestExpectation *)expectation {
    self = [super init];
    if(self){
        _expectation = expectation;
    }
    return self;
}

- (void)imageDidLoad:(BOOL)success {
    [self.expectation fulfill];
}

@end
