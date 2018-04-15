//
//  YleURLMaker.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "URLMaker.h"

@interface YleURLMaker : NSObject <URLMaker>
- (instancetype)initWithAppId:(NSString *)appId appKey:(NSString *)appKey;
@end
