//
//  NetworkingManager.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkingManager <NSObject>
typedef void (^NetworkingManagerCompletion)(NSData *, NSURLResponse *, NSError *);
- (void)resumeDataTaskWithUrl:(NSURL *)url
            completionHandler:(NetworkingManagerCompletion)completionHandler;
@end
