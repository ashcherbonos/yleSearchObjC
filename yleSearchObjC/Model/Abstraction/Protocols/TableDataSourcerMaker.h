//
//  TableDataSourcerMaker.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableDataSource.h"

@protocol TableDataSourcerMaker <NSObject>
- (id <TableDataSource>)makeWithQuery:(NSString *)query
                           completion:(void(^)(void))completion;
@end
