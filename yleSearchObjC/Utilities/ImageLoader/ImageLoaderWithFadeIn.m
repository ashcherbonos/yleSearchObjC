//
//  ImageLoaderWithFadeIn.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "ImageLoaderWithFadeIn.h"
#import "UIImage+PreviewStubImage.h"
#import "AppConstants.h"

@interface ImageLoaderWithFadeIn()
@property (strong, nonatomic, readonly) id <ImageCacher> cache;
@property (strong, nonatomic, readonly) id <NetworkingManager> networkingManager;
@end

@implementation ImageLoaderWithFadeIn

@synthesize delegate;

-(instancetype)initWithCache:(id <ImageCacher>)cache
           networkingManager:(id <NetworkingManager>) networkingManager {
    self = [super init];
    if(self){
        _cache = cache;
        _networkingManager = networkingManager;
    }
    return self;
}

- (void)loadURL:(NSURL *)url intoImageView:(UIImageView *)imageView {
    __weak typeof(self) weakSelf = self;
    if(!url) { return; }
    UIImage *cachedImage = self.cache[url];
    if(cachedImage) {
        imageView.image = cachedImage;
        [self.delegate imageDidLoad:TRUE];
        return;
    }
    [self.networkingManager
     resumeDataTaskWithUrl:url
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         UIImage *image = [UIImage imageWithData:data];
         if(error || !image) {
             dispatch_async(dispatch_get_main_queue(), ^{
                 [weakSelf.delegate imageDidLoad:FALSE];
             });
             return;
         }
         weakSelf.cache[url] = image;
         dispatch_async(dispatch_get_main_queue(), ^{
             [weakSelf fadeImage:image
                              in:imageView];
             [weakSelf.delegate imageDidLoad:TRUE];
         });
     }];
}

- (void)makeStubFor:(UIImageView *)imageView withLabel:(NSString *)label{
    CGSize size = CGSizeMake(PREVIEW_IMAGE_FULL_SIZE, PREVIEW_IMAGE_FULL_SIZE);
    CGFloat diameter = PREVIEW_IMAGE_DIAMETER;
    imageView.image = [[UIImage alloc] initWithSize:size
                                      circleDiametr:diameter
                                           stubChar:[label characterAtIndex:0]];
};

- (void)fadeImage:(UIImage *)image in:(UIImageView *)imageView {
    [UIView transitionWithView:imageView
                      duration:IMAGE_FADE_IN_DURATION
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{ imageView.image = image; }
                    completion:nil];
}

@end
