//
//  TvProgram.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "TvProgram.h"

@implementation TvProgram

- (instancetype)initWithTitle:(NSString *)title
                  fullDescription:(NSString *)fullDescription
                 dataModified:(NSDate *)dataModified
                  programType:(NSString *)programType
              previewImageURL:(NSURL *)previewImageURL
                 fullImageURL:(NSURL *)fullImageURL {
    
    self = [super init];
    if(self){
        _title = title;
        _fullDescription = fullDescription;
        _dataModified = dataModified;
        _programType = programType;
        _previewImageURL = previewImageURL;
        _fullImageURL = fullImageURL;
    }
    return self;
}
@end
