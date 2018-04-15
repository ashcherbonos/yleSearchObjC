//
//  NetworkingManagerMock.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "NetworkingManagerMock.h"

@interface NetworkingManagerMock()
@property (strong, nonatomic, readonly) NSData *data;
@property (strong, nonatomic, readonly) NSURLResponse *urlResponse;
@property (strong, nonatomic, readonly) NSError *error;
@end

@implementation NetworkingManagerMock

- (instancetype)initWithData:(NSData *)data
                 urlResponse:(NSURLResponse *)urlResponse
                       error:(NSError *)error {
    self = [super init];
    if(self){
        _data = data;
        _urlResponse = urlResponse;
        _error = error;
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data
                 urlResponse:(NSURLResponse *)urlResponse{
    self = [super init];
    if(self){
        _data = data;
        _urlResponse = urlResponse;
        _error = nil;
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data {
    self = [super init];
    if(self){
        _data = data;
        _urlResponse = nil;
        _error = nil;
    }
    return self;
}

- (void)resumeDataTaskWithUrl:(NSURL *)url completionHandler:(NetworkingManagerCompletion)completionHandler {
    __weak typeof(self) weakSelf = self;
    dispatch_queue_t globalQ = dispatch_queue_create("globalQ", NULL);
    dispatch_async(globalQ, ^{
        completionHandler(weakSelf.data, weakSelf.urlResponse, weakSelf.error);
    });
}

@end
