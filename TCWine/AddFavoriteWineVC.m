//
//  AddFavoriteWineVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "AddFavoriteWineVC.h"

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
- (IBAction)saveFavWine:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    FavoriteWineEntryTVC *destinationViewController = (FavoriteWineEntryTVC *)segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"favoriteWineEntrySegue"]) {
        [destinationViewController setDelegate:self];
    }

}

-(void)sendFavoriteWineInfoToAddFavWineVC:(NSString *)wineName Winery:(NSString *)winery category:(NSString *)category year:(NSString *)year note:(NSString *)note {

    _favoriteWine = [FavoriteWine initWithWineName:wineName];
    _favoriteWine.winery = winery;
    _favoriteWine.category = category;
    _favoriteWine.year = year;
    _favoriteWine.note = note;
    _favoriteWine.note = note;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addOrUpdateObject:_favoriteWine];
    [realm commitWriteTransaction];
    
    NSLog(@"Winery Name AddFavoriteWineVC: %@", _favoriteWine.name);

}

- (IBAction)cancelButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:nil];
    
}


@end
