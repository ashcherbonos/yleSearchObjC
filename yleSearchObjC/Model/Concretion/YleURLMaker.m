//
//  YleURLMaker.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "YleURLMaker.h"

@interface YleURLMaker()
@property (strong, nonatomic) NSString * appId;
@property (strong, nonatomic) NSString * appKey;
@end

@implementation YleURLMaker

- (instancetype)initWithAppId:(NSString *)appId
                       appKey:(NSString *)appKey {
    self = [super init];
    if(self){
        self.appId = appId;
        self.appKey = appKey;
    }
    return self;
}

- (NSURL *) makeUrlFromQuery:(NSString *)query
                      offset:(NSUInteger)offset
                       limit:(NSUInteger)limit {
    NSURLComponents *components = [[NSURLComponents alloc] init];
    components.scheme = @"https";
    components.host = @"external.api.yle.fi";
    components.path = @"/v1/programs/items.json";
    NSURLQueryItem *offsetItem = [NSURLQueryItem
                                  queryItemWithName:@"offset"
                                  value: [NSString stringWithFormat:@"%lu", (unsigned long)offset]];
    NSURLQueryItem *limitItem = [NSURLQueryItem
                                 queryItemWithName:@"limit"
                                 value: [NSString stringWithFormat:@"%lu", (unsigned long)limit]];
    NSURLQueryItem *queryItem = [NSURLQueryItem
                                 queryItemWithName:@"q"
                                 value: query];
    NSURLQueryItem *appidItem = [NSURLQueryItem
                                 queryItemWithName:@"app_id"
                                 value: self.appId];
    NSURLQueryItem *appkeyItem = [NSURLQueryItem
                                  queryItemWithName:@"app_key"
                                  value: self.appKey];
    components.queryItems = @[offsetItem,
                              limitItem,
                              queryItem,
                              appidItem,
                              appkeyItem];
    return components.URL;
}

@end
