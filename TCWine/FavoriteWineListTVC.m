//
//  FavoriteWineListVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/9/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FavoriteWineListTVC.h"

@interface FavoriteWineListTVC ()
@property (weak, nonatomic) IBOutlet UILabel *favoriteWineListTitle;
@property (weak, nonatomic) IBOutlet UITableView *favoriteWineListTableView;

@end

@implementation FavoriteWineListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = false;
    
    _favoriteWineListTitle.text = [NSString stringWithFormat:@"%@ Favorites", _winery.name];
    
    _favoriteWinesForWineryArray = [FavoriteWine objectsWhere:@"wineryId == %@", _winery.wineryId];

    [self.favoriteWineListTableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _favoriteWinesForWineryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    FavoriteWineListTVCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favoriteWineCell" forIndexPath:indexPath];
    
    [cell setDelegate:self];
    
    _favoriteWine = [_favoriteWinesForWineryArray objectAtIndex:indexPath.row];
    
    cell.wineNameLabel.text = [NSString stringWithFormat:@"%@ %@", _favoriteWine.year, _favoriteWine.name];
    cell.wineryNameLabel.text = _favoriteWine.winery;
    cell.categoryLabel.text = _favoriteWine.category;
    cell.descriptionTextView.text = _favoriteWine.note;

    return cell;

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle==UITableViewCellEditingStyleDelete) {
        [[RLMRealm defaultRealm] beginWriteTransaction];
        [[RLMRealm defaultRealm]deleteObject:[_favoriteWinesForWineryArray objectAtIndex:indexPath.row]];
        [[RLMRealm defaultRealm] commitWriteTransaction];
        _favoriteWinesForWineryArray = [FavoriteWine objectsWhere:@"wineryId == %@", _winery.wineryId];
        
        [_favoriteWineListTableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_favoriteWineListTableView setEditing:NO animated:YES];
    }
    
    [_favoriteWineListTableView reloadData];
}

- (IBAction)dismissView:(id)sender {
    
    [self dismissViewControllerAnimated:FALSE completion:nil];
    
}

-(void)favoriteWineListCellTapped:(id)sender {
    NSIndexPath *indexPath = [self.favoriteWineListTableView indexPathForCell:sender];
    _selectedFavoriteWine = [_favoriteWinesForWineryArray objectAtIndex:indexPath.row];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqualToString: @"editFavoriteWineSegue"]) {

        AddFavoriteWineVC *destinationVC = (AddFavoriteWineVC *)segue.destinationViewController;
        destinationVC.favoriteWineToEdit = _selectedFavoriteWine;
        
    } else if ([segue.identifier isEqualToString:@"addFavoriteWineSegue"]) {
        AddFavoriteWineVC *destinationVC = (AddFavoriteWineVC *)segue.destinationViewController;
        destinationVC.winery = self.winery;
    }

}


@end
