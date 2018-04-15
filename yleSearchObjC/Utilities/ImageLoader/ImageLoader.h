//
//  ImageLoader.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageLoaderDelegate <NSObject>
- (void)imageDidLoad:(BOOL)success;
@end

@protocol ImageLoader <NSObject>
@property (weak, nonatomic) id <ImageLoaderDelegate> delegate;
- (void)loadURL:(NSURL *)url intoImageView:(UIImageView *)imageView;
- (void)makeStubFor:(UIImageView *)imageView withLabel:(NSString *)label;
@end

@protocol ImageLoaderMaker <NSObject>
- (id <ImageLoader>)make;
@end
