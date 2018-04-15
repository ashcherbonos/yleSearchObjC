//
//  TvProgramTableViewCell.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "TvProgramTableViewCell.h"
#import "ImageLoader.h"
#import "TvProgram.h"

@interface TvProgramTableViewCell()
@property (strong, nonatomic) id<ImageLoader>imageLoader;
@end

@implementation TvProgramTableViewCell

- (void) fillWithData:(id)data
          imageLoader:(id <ImageLoader>)imageLoader {
    if(![data isMemberOfClass:[TvProgram class]]){return;}
    
    TvProgram *programm = (TvProgram *)data;
    self.textLabel.text = programm.title;
    self.detailTextLabel.text = programm.fullDescription;
    self.imageLoader = imageLoader;
    [self.imageLoader makeStubFor:self.imageView
                        withLabel:programm.title];
    [self.imageLoader loadURL:programm.previewImageURL
                intoImageView:self.imageView];
}

@end
