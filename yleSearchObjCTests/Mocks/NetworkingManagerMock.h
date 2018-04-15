//
//  NetworkingManagerMock.h
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkingManager.h"

@interface NetworkingManagerMock : NSObject <NetworkingManager>
- (instancetype)initWithData:(NSData *)data
                 urlResponse:(NSURLResponse *)urlResponse
                       error:(NSError *)error;

- (instancetype)initWithData:(NSData *)data
                 urlResponse:(NSURLResponse *)urlResponse;

- (instancetype)initWithData:(NSData *)data;

@end
