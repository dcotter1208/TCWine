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
    NSLog(@"View Appeared");
    _favoriteWinesForWineryArray = [FavoriteWine objectsWhere:@"wineryId == %@", _winery.wineryId];
    [self.favoriteWineListTableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _favoriteWinesForWineryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    FavoriteWineListTVCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favoriteWineCell" forIndexPath:indexPath];
    
    _favoriteWine = [_favoriteWinesForWineryArray objectAtIndex:indexPath.row];
    
    cell.wineNameLabel.text = [NSString stringWithFormat:@"%@ %@", _favoriteWine.year, _favoriteWine.name];
    cell.wineryNameLabel.text = _favoriteWine.winery;
    cell.categoryLabel.text = _favoriteWine.category;
    cell.descriptionTextView.text = _favoriteWine.note;

    return cell;

}


- (IBAction)dismissView:(id)sender {
    
    [self dismissViewControllerAnimated:FALSE completion:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqualToString: @"editFavoriteWineSegue"]) {
        
        NSIndexPath *indexPath = [self.favoriteWineListTableView indexPathForSelectedRow];
        _selectedFavoriteWine = [_favoriteWinesForWineryArray objectAtIndex:indexPath.row];
//        NSLog(@"Selected Favorite Wine: %@", _selectedFavoriteWine);
        
        AddFavoriteWineVC *destinationVC = (AddFavoriteWineVC *)segue.destinationViewController;
        destinationVC.favoriteWineToEdit = _selectedFavoriteWine;
        
    } else if ([segue.identifier isEqualToString:@"addFavoriteWineSegue"]) {
        AddFavoriteWineVC *destinationVC = (AddFavoriteWineVC *)segue.destinationViewController;
        destinationVC.winery = self.winery;
    }

}

- (IBAction)editFavoriteWineButtonPressed:(id)sender {
    
    [self.delegate getSelectedWineToEdit:_selectedFavoriteWine];
    
    NSIndexPath *indexPath = [self.favoriteWineListTableView indexPathForSelectedRow];
    _selectedFavoriteWine = [_favoriteWinesForWineryArray objectAtIndex:indexPath.row];
    NSLog(@"EDIT BUTTON SELECTED: %@", _selectedFavoriteWine);
    
}


@end
