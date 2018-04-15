//
//  TableDataSource.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TableDataSource <NSObject>
@property(nonatomic, readonly)NSInteger count;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)loadDataInAmount:(NSInteger)amount;
@end
