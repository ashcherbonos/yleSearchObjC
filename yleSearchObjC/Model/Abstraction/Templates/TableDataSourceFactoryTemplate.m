//
//  TableDataSourceFactoryTemplate.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "TableDataSourceFactoryTemplate.h"

@interface TableDataSourceFactoryTemplate()
@property (strong, nonatomic, readonly) id <URLMaker> urlMaker;
@property (strong, nonatomic, readonly) id <JSONParser> parser;
@property (strong, nonatomic, readonly) id <NetworkingManager> networkManager;
@end

@implementation TableDataSourceFactoryTemplate

- (instancetype)initWithURLMaker:(id <URLMaker>)urlMaker
                          parser:(id <JSONParser>)parser
                  networkManager:(id <NetworkingManager>)networkManager {
    self = [super init];
    if(self){
        _urlMaker = urlMaker;
        _parser = parser;
        _networkManager = networkManager;
    }
    return self;
}

- (id <TableDataSource>)makeWithQuery:(NSString *)query
                           completion:(void(^)(void))completion {
    return [[TableDataSourceTemplate alloc]
            initWithSearch:query
            urlMaker:self.urlMaker
            parser:self.parser
            networkManager:self.networkManager
            completion:completion];
}

@end
