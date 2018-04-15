//
//  YleJSONParser.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONParser.h"

@interface YleJSONParser : NSObject <JSONParser>
- (NSArray *)parse:(NSData *)data;
@end
