//
//  TableDataSourceTemplate.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableDataSource.h"
#import "URLMaker.h"
#import "JSONParser.h"
#import "NetworkingManager.h"

@interface TableDataSourceTemplate : NSObject <TableDataSource>

typedef void (^TableDataSourceComplition)(void);

- (instancetype) initWithSearch:(NSString *)searchTerm
                       urlMaker:(id <URLMaker>)urlMaker
                         parser:(id <JSONParser>)parser
                 networkManager:(id <NetworkingManager>)networkManager
                     completion:(TableDataSourceComplition)completion;
@end
