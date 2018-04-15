//
//  TableDataSourceFactoryTemplate.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableDataSource.h"
#import "TableDataSourcerMaker.h"
#import "TableDataSourceTemplate.h"
#import "URLMaker.h"
#import "JSONParser.h"
#import "NetworkingManager.h"

@interface TableDataSourceFactoryTemplate : NSObject <TableDataSourcerMaker>
- (instancetype)initWithURLMaker:(id <URLMaker>)urlMaker
                          parser:(id <JSONParser>)parser
                  networkManager:(id <NetworkingManager>)networkManager;
@end
