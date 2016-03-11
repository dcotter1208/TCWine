//
//  WineryListVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryListVC.h"
#import "WineryDetailTVC.h"

@interface WineryListVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *wineryListTableView;

@end

@implementation WineryListVC
@synthesize listWineryArray = _listWineryArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    _listWineryArray = [Winery allObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listWineryArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Winery *wineries = [_listWineryArray objectAtIndex:indexPath.row];
    cell.textLabel.text = wineries.name;
    //cell.detailTextLabel.text = wineries.phoneNumber;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toWineryDetailVC"]) {
        WineryDetailTVC *destinationVC = (WineryDetailTVC*)segue.destinationViewController;
        NSIndexPath *indexPath = [self.wineryListTableView indexPathForSelectedRow];
        destinationVC.wineryFromTableview = [_listWineryArray objectAtIndex:indexPath.row];
    }
}


@end
