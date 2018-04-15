//
//  TvProgram.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TvProgram : NSObject
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *fullDescription;
@property (nonatomic, readonly) NSDate *dataModified;
@property (nonatomic, readonly) NSString *programType;
@property (nonatomic, readonly) NSURL *previewImageURL;
@property (nonatomic, readonly) NSURL *fullImageURL;
- (instancetype)initWithTitle:(NSString *)title
              fullDescription:(NSString *)fullDescription
                 dataModified:(NSDate *)dataModified
                  programType:(NSString *)programType
              previewImageURL:(NSURL *)previewImageURL
                 fullImageURL:(NSURL *)fullImageURL;
@end
