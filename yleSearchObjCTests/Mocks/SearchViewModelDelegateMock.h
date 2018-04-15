//
//  SearchViewModelDelegateMock.h
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchViewModel.h"
#import <XCTest/XCTest.h>

@interface SearchViewModelDelegateMock : NSObject <SearchViewModelDelegate, DataConsumer>
@property(strong,nonatomic)id filledData;
-(instancetype)initWithExpectation:(XCTestExpectation *)expectation;
@end
