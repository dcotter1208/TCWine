//
//  FavoriteWineListVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/9/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FavoriteWineListVC.h"

@interface FavoriteWineListVC ()
@property (weak, nonatomic) IBOutlet UILabel *favoriteWineListTitle;

@end

@implementation FavoriteWineListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    
    NSLog(@"Winery Name: %@", _winery.name);

    _favoriteWineListTitle.text = [NSString stringWithFormat:@"%@ Favorites", _winery.name];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = false;
}

- (IBAction)dismissView:(id)sender {
    
    [self dismissViewControllerAnimated:FALSE completion:nil];
    
}





@end
