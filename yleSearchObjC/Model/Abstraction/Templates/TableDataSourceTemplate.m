//
//  TableDataSourceTemplate.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "TableDataSourceTemplate.h"

@interface TableDataSourceTemplate()
@property NSMutableArray *items;
@property (nonatomic, readonly) NSString *searchTerm;
@property (nonatomic, readonly) id <URLMaker> urlMaker;
@property (nonatomic, readonly) id <JSONParser> parser;
@property (nonatomic, readonly) id <NetworkingManager> networkManager;
@property (nonatomic, readonly) TableDataSourceComplition completion;
@property (nonatomic) BOOL moreResultsAvaliable;
@end

@implementation TableDataSourceTemplate

- (instancetype)initWithSearch:(NSString *)searchTerm
                      urlMaker:(id <URLMaker>)urlMaker
                        parser:(id <JSONParser>)parser
                networkManager:(id <NetworkingManager>)networkManager
                    completion:(TableDataSourceComplition)completion {
    self = [super init];
    if(self){
        _searchTerm = searchTerm;
        _urlMaker = urlMaker;
        _parser = parser;
        _networkManager = networkManager;
        _completion = completion;
        _moreResultsAvaliable = YES;
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)count {
    return self.items.count;
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.items[index];
}

- (void)loadDataInAmount:(NSInteger)amount {
    __weak typeof(self) weakSelf = self;
    if(!self.moreResultsAvaliable) {
        return;
    }
    NSURL *url = [self.urlMaker makeUrlFromQuery:self.searchTerm
                                         offset:self.items.count
                                          limit:amount];
    [self.networkManager resumeDataTaskWithUrl:url
                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                 if(error){return;}
                                 NSArray *items = [weakSelf.parser parse:data];
                                 weakSelf.moreResultsAvaliable = items.count > 0;
                                 [weakSelf.items addObjectsFromArray:items];
                                 dispatch_async(dispatch_get_main_queue(), ^{weakSelf.completion();});
                             }];
}

@end
