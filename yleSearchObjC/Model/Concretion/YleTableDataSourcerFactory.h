//
//  YleTableDataSourcerFactory.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableDataSourcerMaker.h"
#import "NetworkingManager.h"

@interface YleTableDataSourcerFactory : NSObject <TableDataSourcerMaker>
- (instancetype)initWithNetworkingManager:(id <NetworkingManager> )networkManager;
@end
