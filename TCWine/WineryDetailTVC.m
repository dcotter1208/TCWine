//
//  WineryDetailTVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryDetailTVC.h"
#import "WineryPhotosCVC.h"
#import "WineryWebsiteVC.h"

@interface WineryDetailTVC ()

@property (weak, nonatomic) IBOutlet UILabel *wineryNameCellLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryWebsiteLabel;

@end

@implementation WineryDetailTVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = false;

    WineryPhotosCVC *wineryPhotosCVC = self.childViewControllers[0];
   
    if (_passedAnnotation == nil) {
        wineryPhotosCVC.winery = self.winery;
        [self displayWineryDetails:_winery];
    } else {
        _winery = _passedAnnotation.wineryAtAnnotation;
        [self displayWineryDetails:_winery];
        wineryPhotosCVC.passedAnnotation = self.passedAnnotation;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayWineryDetails:(Winery *)winery {
    self.wineryNameCellLabel.text = winery.name;
    self.wineryAddressLabel.text = winery.address;
    
    if (winery.phoneNumber == NULL){
        self.wineryPhoneLabel.text = @"Not Available";
    } else {
        self.wineryPhoneLabel.text = winery.phoneNumber;
    }
    
    if (winery.website == NULL){
        self.wineryWebsiteLabel.text = @"Not Available";
    } else {
        self.wineryWebsiteLabel.text = winery.website;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqualToString: @"favoriteWineListVCSegue"]) {
        FavoriteWineListTVC *destinationVC = (FavoriteWineListTVC *)segue.destinationViewController;
        destinationVC.winery = _winery;
    }
    
    //FIGURE OUT HOW TO PREVENT SEGUE FROM OCCURRING IF THE WEBSITE IS NOT AVAILABLE!
    
    if ([_wineryWebsiteLabel.text isEqualToString:@"Not Available"]) {
            NSLog(@"DISPLAY ALERT FOR NOT AVAILABLE");
    } else if (![_wineryWebsiteLabel.text isEqualToString:@"Not Available"]) {
        if ([segue.identifier isEqualToString:@"segueToWineryWebsite"]) {
            WineryWebsiteVC *wineryWebsiteVC = (WineryWebsiteVC *)segue.destinationViewController;

            wineryWebsiteVC.wineryWebsiteURLString = _wineryWebsiteLabel.text;
        }
    }
    

}


@end
