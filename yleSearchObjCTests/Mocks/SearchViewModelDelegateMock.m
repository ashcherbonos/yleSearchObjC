//
//  SearchViewModelDelegateMock.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "SearchViewModelDelegateMock.h"

@interface SearchViewModelDelegateMock()
@property (strong, nonatomic, readonly) XCTestExpectation *expectation;
@end

@implementation SearchViewModelDelegateMock

-(instancetype)initWithExpectation:(XCTestExpectation *)expectation {
    self = [super init];
    if(self){
        _expectation = expectation;
    }
    return self;
}

- (void)updateView {
    [self.expectation fulfill];
}

- (void)fillWithData:(id)data imageLoader:(id<ImageLoader>)imageLoader {
    self.filledData = data;
    [self.expectation fulfill];
}

@end
