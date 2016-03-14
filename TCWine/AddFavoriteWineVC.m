//
//  AddFavoriteWineVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "AddFavoriteWineVC.h"
#import "FavoriteWineEntryTVC.h"

@interface AddFavoriteWineVC ()

@end

@implementation AddFavoriteWineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    FavoriteWineEntryTVC *favoriteWineEntryTVC = self.childViewControllers[0];
    favoriteWineEntryTVC.winery = self.winery;
    favoriteWineEntryTVC.favoriteWineToEdit = _favoriteWineToEdit;

}

- (IBAction)saveFavWine:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    FavoriteWineEntryTVC *destinationViewController = (FavoriteWineEntryTVC *)segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"favoriteWineEntrySegue"]) {
        [destinationViewController setDelegate:self];
    }

}

-(void)sendFavoriteWineInfoToAddFavWineVC:(NSString *)wineName Winery:(NSString *)winery category:(NSString *)category year:(NSString *)year note:(NSString *)note wineryId:(NSString *)wineryId uniqueWineId:(NSString *)uniqueWineId{

    NSLog(@"Wine Name: %@", wineName);
    
    _favoriteWine = [FavoriteWine initWithWineName:wineName];
    _favoriteWine.winery = winery;
    _favoriteWine.category = category;
    _favoriteWine.year = year;
    _favoriteWine.note = note;
    _favoriteWine.wineryId = wineryId;
    _favoriteWine.uniqueWineId = uniqueWineId;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    if (![wineName isEqualToString: @""]) {
        [realm beginWriteTransaction];
        [realm addOrUpdateObject:_favoriteWine];
        [realm commitWriteTransaction];
    }

}

- (IBAction)cancelButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:nil];
    
}

-(void)displayAlert {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please Enter Wine Name!" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:false completion:nil];
        
}


@end
