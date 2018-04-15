//
//  ImageLoaderWithFadeInFactory.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "ImageLoaderWithFadeInFactory.h"

@interface ImageLoaderWithFadeInFactory()
@property (strong, nonatomic, readonly) id <ImageCacher> cache;
@property (strong, nonatomic, readonly) id <NetworkingManager> networkingManager;
@end

@implementation ImageLoaderWithFadeInFactory

-(instancetype)initWithCache:(id <ImageCacher>)cache
           networkingManager:(id <NetworkingManager>)networkingManager {
    self = [super init];
    if(self){
        _cache = cache;
        _networkingManager = networkingManager;
    }
    return self;
}

- (id <ImageLoader>)make{
    return [[ImageLoaderWithFadeIn alloc] initWithCache:self.cache
                                      networkingManager:self.networkingManager];
}

@end
