//
//  SearchViewController.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/13/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchViewModel.h"
#import "YleSearchViewModelBuilder.h"
#import "TvProgramTableViewCell.h"

@interface SearchViewController () <SearchViewModelDelegate, UISearchControllerDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SearchViewModel *viewModel;
@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YleSearchViewModelBuilder *viewModelBuilder = [[YleSearchViewModelBuilder alloc] init];
    self.viewModel = [viewModelBuilder makeWithDelegate:self];
    [self makeSearchBarInNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self.viewModel emptyMemory];
}

#pragma mark - SearchViewModelDelegate

- (void)updateView {
    [self.tableView reloadData];
}

#pragma mark - Search Bar

- (void)dismissKeyboard {
    [self.searchController resignFirstResponder];
}

- (void)makeSearchBarInNavigationBar {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self];
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.hidesNavigationBarDuringPresentation = false;
    self.searchController.dimsBackgroundDuringPresentation = false;
    self.searchController.searchBar.tintColor = [UIColor lightGrayColor];
    self.searchController.searchBar.showsCancelButton = false;
    self.navigationItem.titleView = self.searchController.searchBar;
    self.definesPresentationContext = true;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self dismissKeyboard];
    if(!searchBar.text) {return;}
    [self.viewModel searchFor:searchBar.text];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TvProgramTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultCell"];
    if([cell conformsToProtocol:@protocol(DataConsumer)]) {
        [self.viewModel fillConsumer:cell withDataIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!self.viewModel.isReady) {return;}
    if(indexPath.row != self.viewModel.dataLastIndex)  {return;}
    [self.viewModel loadMoreData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if(![segue.destinationViewController
         conformsToProtocol:@protocol(DataConsumer)]) {
        return;
    }
    NSInteger selectedCellIndex = self.tableView.indexPathForSelectedRow.row;
    [self.viewModel fillConsumer:segue.destinationViewController
                   withDataIndex:selectedCellIndex];
}

@end