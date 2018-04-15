//
//  NetworkingManagerShared.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "NetworkingManagerShared.h"

@implementation NetworkingManagerShared

- (void) resumeDataTaskWithUrl:(NSURL *)url
             completionHandler:(NetworkingManagerCompletion)completionHandler {
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                     completionHandler:completionHandler];
    [downloadTask resume];
}

@end
