//
//  WineryDetailTVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryDetailTVC.h"

@interface WineryDetailTVC ()

@property (weak, nonatomic) IBOutlet UILabel *wineryNameCellLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryWebsiteLabel;

@end

@implementation WineryDetailTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = false;
    
    _winery = _passedAnnotation.wineryAtAnnotation;
    
    [self displayWineryDetails];
    
    NSLog(@"Winery Name: %@", _winery.name);
    NSLog(@"Winery Address: %@", _winery.address);
    NSLog(@"Winery Website: %@", _winery.website);
    NSLog(@"Winery Phone: %@", _winery.phoneNumber);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayWineryDetails{
    self.wineryNameCellLabel.text = _winery.name;
    self.wineryAddressLabel.text = _winery.address;
    
    if (_winery.phoneNumber == NULL){
        self.wineryPhoneLabel.text = @"Not Available";
    } else {
        self.wineryPhoneLabel.text = _winery.phoneNumber;
    }
    
    if (_winery.website == NULL){
        self.wineryWebsiteLabel.text = @"Not Available";
    } else {
        self.wineryWebsiteLabel.text = _winery.website;
    }
    
}


@end
