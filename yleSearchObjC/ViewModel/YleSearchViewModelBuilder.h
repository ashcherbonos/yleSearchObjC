//
//  YleSearchViewModelBuilder.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchViewModel.h"
#import "NetworkingManagerShared.h"
#import "YleTableDataSourcerFactory.h"
#import "ImageCache.h"
#import "ImageLoaderWithFadeInFactory.h"

@interface YleSearchViewModelBuilder : NSObject
-(SearchViewModel *) makeWithDelegate:(id<SearchViewModelDelegate>)delegate;
@end
