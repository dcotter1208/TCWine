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
@property (weak, nonatomic) IBOutlet UILabel *favoriteWineCellLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteWineWineryCellLabel;


@end

@implementation FavoriteWineListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    
    _favoriteWineListTitle.text = [NSString stringWithFormat:@"%@ Favorites", _winery.name];
    _favoriteWinesForWineryArray = [Winery objectsWhere:@"name == %@", _winery.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = false;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _favoriteWinesForWineryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favoriteWineCell" forIndexPath:indexPath];

    FavoriteWine *favoriteWine = [_favoriteWinesForWineryArray objectAtIndex:indexPath.row];
    
    return cell;

}

- (IBAction)dismissView:(id)sender {
    
    [self dismissViewControllerAnimated:FALSE completion:nil];
    
}





@end
