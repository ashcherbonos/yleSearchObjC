//
//  SearchViewController.h
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewModel.h"

// abstract class
@interface SearchViewController : UIViewController <SearchViewModelDelegate>
-(SearchViewModel *)makeViewModel; // abstract method
@end
