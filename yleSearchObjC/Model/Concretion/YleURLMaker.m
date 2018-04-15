//
//  YleURLMaker.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "YleURLMaker.h"

@implementation YleURLMaker

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
                                 value: @"73f7299c"];
    NSURLQueryItem *appkeyItem = [NSURLQueryItem
                                  queryItemWithName:@"app_key"
                                  value: @"41a235aabc2fc3c4f9bba2627cca97bc"];
    components.queryItems = @[offsetItem,
                              limitItem,
                              queryItem,
                              appidItem,
                              appkeyItem];
    return components.URL;
}

@end
