//
//  YLESearchViewController.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "YLESearchViewController.h"
#import "YleSearchViewModelBuilder.h"

@implementation YLESearchViewController

-(SearchViewModel *)makeViewModel{
    YleSearchViewModelBuilder *viewModelBuilder = [[YleSearchViewModelBuilder alloc] init];
    return [viewModelBuilder makeWithDelegate:self];
}

@end
