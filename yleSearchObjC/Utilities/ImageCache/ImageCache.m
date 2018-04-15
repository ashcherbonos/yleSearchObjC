//
//  ImageCache.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "ImageCache.h"

@interface ImageCache()
@property (strong, nonatomic, readonly) NSCache *cache;
@end
@implementation ImageCache

@synthesize cache = _cache;

- (NSCache *)cache {
    if(!_cache){
        _cache = [[NSCache alloc] init];
    }
    return _cache;
}

- (void)empty {
    [self.cache removeAllObjects];
}

- (UIImage *)objectForKeyedSubscript:(NSURL *)url {
    return [self.cache objectForKey:url];
}
- (void)setObject:(UIImage *)image forKeyedSubscript:(NSURL *)url {
    [self.cache setObject:image forKey:url];
}

@end
