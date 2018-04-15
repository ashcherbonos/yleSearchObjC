//
//  YleTableDataSourcerFactory.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "YleTableDataSourcerFactory.h"
#import "TableDataSourceFactoryTemplate.h"
#import "YleURLMaker.h"
#import "YleJSONParser.h"

@interface YleTableDataSourcerFactory()
@property (strong, nonatomic, readonly) id <TableDataSourcerMaker> factory;
@end

@implementation YleTableDataSourcerFactory

- (instancetype)initWithNetworkingManager:( id <NetworkingManager>)networkManager {
    self = [super init];
    if(self){
        _factory = [[TableDataSourceFactoryTemplate alloc]
                    initWithURLMaker:[[YleURLMaker alloc] init]
                    parser:[[YleJSONParser alloc] init]
                    networkManager:networkManager];
    }
    return self;
}

- (id<TableDataSource>)makeWithQuery:(NSString *)query completion:(void (^)(void))completion {
    return [self.factory makeWithQuery:query completion:completion];
}

@end
