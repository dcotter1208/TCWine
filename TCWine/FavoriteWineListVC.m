//
//  FavoriteWineListVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/9/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FavoriteWineListVC.h"

@interface FavoriteWineListVC ()

@end

@implementation FavoriteWineListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = false;
}


- (IBAction)addFavoriteWine:(id)sender {
    
}

- (IBAction)dismissView:(id)sender {
    
    [self dismissViewControllerAnimated:FALSE completion:nil];
    
}


@end
