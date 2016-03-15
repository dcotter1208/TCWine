//
//  WineryDetailTVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryDetailTVC.h"
#import "WineryPhotosCVC.h"
#import "FavoriteWineListTVC.h"

@interface WineryDetailTVC ()

@property (weak, nonatomic) IBOutlet UILabel *wineryNameCellLabel;
@property (weak, nonatomic) IBOutlet UITextView *addressTextView;
@property (weak, nonatomic) IBOutlet UITextView *phoneTextView;
@property (weak, nonatomic) IBOutlet UITextView *websiteTextView;

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
    self.addressTextView.text = winery.address;
    
    if (winery.phoneNumber == nil){
        self.phoneTextView.text = @"Not Available";
    } else {
        self.phoneTextView.text = winery.phoneNumber;
    }
    
    if (winery.website == nil){
        _websiteTextView.text = @"Not Available";
    } else {
        _websiteTextView.text = winery.website;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqualToString: @"favoriteWineListVCSegue"]) {
        FavoriteWineListTVC *destinationVC = (FavoriteWineListTVC *)segue.destinationViewController;
        destinationVC.winery = _winery;
    }

}

- (IBAction)foursquareButtonTapped:(id)sender {

    NSURL *websiteURL = [[NSURL alloc] initWithString:[NSString stringWithFormat: @"https://foursquare.com/v/%@", _winery.wineryId]];
    [[UIApplication sharedApplication]openURL:websiteURL];
    
}

@end
