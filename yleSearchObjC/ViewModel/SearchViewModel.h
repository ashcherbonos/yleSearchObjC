//
//  SearchViewModel.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableDataSource.h"
#import "ImageLoader.h"
#import "ImageCacher.h"
#import "TableDataSourcerMaker.h"

@protocol SearchViewModelDelegate <NSObject>
- (void) updateView;
@end

@protocol DataConsumer <NSObject>
- (void) fillWithData:(id)data
          imageLoader:(id <ImageLoader>)imageLoader;
@end

@interface SearchViewModel : NSObject

@property (nonatomic, readonly) NSInteger dataCount;
@property (nonatomic, readonly) NSInteger dataLastIndex;
@property (nonatomic, readonly) BOOL isReady;
@property (weak, nonatomic) id <SearchViewModelDelegate> delegate;

-(instancetype)initWithDelegate:(id <SearchViewModelDelegate>)delegate
              dataSourceFactory:(id <TableDataSourcerMaker>)dataSourceFactory
             imageLoaderFactory:(id <ImageLoaderMaker>)imageLoaderFactory
                          cache:(id <ImageCacher>)cache;
- (void) searchFor:(NSString *)query;
- (void) loadMoreData;
- (void) fillConsumer:(id <DataConsumer>)consumer
        withDataIndex:(NSUInteger) index;
- (void) emptyMemory;
@end







