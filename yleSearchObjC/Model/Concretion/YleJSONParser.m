//
//  YleJSONParser.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YleJSONParser.h"
#import "TvProgram.h"

@interface YleJSONParser()
@property (readonly) int deviceScreenSmallerSideSize;
@end

@implementation YleJSONParser

- (int)deviceScreenSmallerSideSize {
    return MIN(UIScreen.mainScreen.bounds.size.height, UIScreen.mainScreen.bounds.size.width);
}

- (NSArray *)parse:(NSData *)data {
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0 error:nil];
    NSArray *jsonDataArray = jsonDictionary[@"data"];
    return [self parseProgramsArray:jsonDataArray];
}

- (NSArray *)parseProgramsArray:(NSArray *)jsonDataArray{
    NSMutableArray *programs = [[NSMutableArray alloc] init];
    for (NSDictionary *item in jsonDataArray){
        TvProgram *program = [self parseProgramItem:item];
        [programs addObject:program];
    }
    return programs;
}

- (TvProgram *)parseProgramItem:(NSDictionary *)item {
    NSString *title = item[@"itemTitle"][@"fi"];
    NSString *fullDescription = item[@"description"][@"fi"];
    NSString *dataModifiedString = item[@"indexDataModified"];
    NSString *programType = item[@"type"];
    NSString *imageID = item[@"image"][@"id"];
    TvProgram *tvProgram = [[TvProgram alloc] initWithTitle:title
                                            fullDescription:fullDescription
                                               dataModified:[self converteStringToDate:dataModifiedString]
                                                programType:programType
                                            previewImageURL:[self makePreviewImageURL:imageID]
                                               fullImageURL:[self makeFullImageURL:imageID]];
    return tvProgram;
}

- (NSDate *)converteStringToDate:(NSString *)string {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZ";
    return [dateFormatter dateFromString:string];
}

- (NSURL *)makeFullImageURL:(NSString *)imageID {
    NSString *urlString = [NSString stringWithFormat:@"https://images.cdn.yle.fi/image/upload/w_%d,h_%d,c_fill/%@.png", self.deviceScreenSmallerSideSize, self.deviceScreenSmallerSideSize, imageID];
    return [NSURL URLWithString:urlString];
}

- (NSURL *)makePreviewImageURL:(NSString *)imageID {
    NSString *urlString = [NSString stringWithFormat:@"https://images.cdn.yle.fi/image/upload/w_256,h_256,c_thumb,r_max/bo_20px_solid_white/%@.png", imageID];
    return [NSURL URLWithString:urlString];
}

@end
