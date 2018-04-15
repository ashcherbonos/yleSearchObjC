//
//  ImageCacher.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageCacher <NSObject>
- (UIImage *)objectForKeyedSubscript:(NSURL *)url;
- (void)setObject:(UIImage *)image forKeyedSubscript:(NSURL *)url;
- (void)empty;
@end
