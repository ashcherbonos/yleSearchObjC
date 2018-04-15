//
//  TvProgramDetailsViewController.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "TvProgramDetailsViewController.h"
#import "TvProgram.h"
#import "NSDate+timeAgoAsString.h"

@interface TvProgramDetailsViewController ()
@property (strong, nonatomic) TvProgram *programm;
@property (strong,nonatomic) id<ImageLoader>imageLoader;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation TvProgramDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageLoader loadURL:self.programm.fullImageURL
                intoImageView:self.imageView];
    self.titleLabel.text = self.programm.title;
    self.typeLabel.text = self.programm.programType;
    self.dateLabel.text = [self.programm.dataModified timeAgoAsString];
    self.descriptionLabel.text = self.programm.fullDescription;
}

- (void) fillWithData:(NSArray *)data
          imageLoader:(id <ImageLoader>)imageLoader {
    if(![data isMemberOfClass:[TvProgram class]]){return;}
    
    self.programm = (TvProgram*)data;
    self.imageLoader = imageLoader;
    self.imageLoader.delegate = self;
}

- (void)imageDidLoad:(BOOL)success{
    [self.activityIndicator stopAnimating];
    if(!success) {
        [self.imageView removeFromSuperview];
    }
}


@end
