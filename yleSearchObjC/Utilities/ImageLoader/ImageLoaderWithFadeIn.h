//
//  ImageLoaderWithFadeIn.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageLoader.h"
#import "ImageCacher.h"
#import "NetworkingManager.h"

@interface ImageLoaderWithFadeIn : NSObject <ImageLoader>
-(instancetype)initWithCache:(id <ImageCacher>)cache
           networkingManager:(id <NetworkingManager>) networkingManager;
@end
