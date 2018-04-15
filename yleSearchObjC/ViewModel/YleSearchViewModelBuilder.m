//
//  YleSearchViewModelBuilder.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "YleSearchViewModelBuilder.h"

@implementation YleSearchViewModelBuilder

-(SearchViewModel *) makeWithDelegate:(id<SearchViewModelDelegate>)delegate {
    NetworkingManagerShared *networkManager = [[NetworkingManagerShared alloc] init];
    YleTableDataSourcerFactory *dataSourcerFactory = [[YleTableDataSourcerFactory alloc] initWithNetworkingManager:networkManager];
    ImageCache *cache = [[ImageCache alloc] init];
    ImageLoaderWithFadeInFactory *imageLoaderFactory = [[ImageLoaderWithFadeInFactory alloc] initWithCache:cache
                                                                                         networkingManager:networkManager];
    return [[SearchViewModel alloc] initWithDelegate:delegate
                                   dataSourceFactory:dataSourcerFactory
                                  imageLoaderFactory:imageLoaderFactory
                                               cache:cache];
}
@end
