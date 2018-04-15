//
//  JSONParser.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONParser <NSObject>
- (NSArray *)parse:(NSData *)data;
@end
