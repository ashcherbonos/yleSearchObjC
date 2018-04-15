//
//  URLMaker.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URLMaker <NSObject>
- (NSURL *) makeUrlFromQuery:(NSString *)query offset:(NSUInteger)offset limit:(NSUInteger)limit;
@end
