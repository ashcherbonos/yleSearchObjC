//
//  SearchViewModel.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "SearchViewModel.h"
#import "AppConstants.h"

@interface SearchViewModel()
@property (nonatomic) BOOL loadingData;
@property (strong, nonatomic) id <TableDataSource> dataSource;
@property (strong, nonatomic, readonly) id <TableDataSourcerMaker> dataSourceFactory;
@property (strong, nonatomic, readonly) id <ImageLoaderMaker> imageLoaderFactory;
@property (strong, nonatomic, readonly) id <ImageCacher> cache;
@end

@implementation SearchViewModel

- (NSInteger)dataCount {
    return self.dataSource.count;
}

- (NSInteger)dataLastIndex {
    return self.dataSource.count - 1;
}

- (BOOL)isReady {
    return !self.loadingData;
}

-(instancetype)initWithDelegate:(id <SearchViewModelDelegate>)delegate
              dataSourceFactory:(id <TableDataSourcerMaker>)dataSourceFactory
             imageLoaderFactory:(id <ImageLoaderMaker>)imageLoaderFactory
                          cache:(id <ImageCacher>)cache {
    self = [super init];
    if(self){
        _delegate = delegate;
        _dataSourceFactory = dataSourceFactory;
        _imageLoaderFactory = imageLoaderFactory;
        _cache = cache;
    }
    return self;
}

- (void)searchFor:(NSString *)query {
    self.dataSource = [self.dataSourceFactory
                       makeWithQuery:query
                       completion:^{
                           self.loadingData = false;
                           [self.delegate updateView];
                       }];
    [self loadData];
}

- (void)loadMoreData {
    [self loadData];
}

- (void)fillConsumer:(id <DataConsumer>)consumer
        withDataIndex:(NSUInteger) index {
    id <ImageLoader> imageLoader = [self.imageLoaderFactory make];
    [consumer fillWithData:self.dataSource[index]
               imageLoader:imageLoader];
}

- (void)loadData {
    self.loadingData = true;
    [self.dataSource loadDataInAmount:AMOUNT_OF_ROWS_TO_LOADS];
}

- (void)emptyMemory{
    [self.cache empty];
}

@end
