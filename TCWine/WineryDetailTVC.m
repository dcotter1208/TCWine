//
//  WineryDetailTVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryDetailTVC.h"
#import "WineryPhotosCVC.h"

@interface WineryDetailTVC ()

@property (weak, nonatomic) IBOutlet UILabel *wineryNameCellLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryWebsiteLabel;

@end

@implementation WineryDetailTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (_passedAnnotation == nil) {
//        [self displayWineryDetails:_winery];
//    } else {
//        _winery = _passedAnnotation.wineryAtAnnotation;
//        [self displayWineryDetails:_winery];
//    }
//    
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
        NSLog(@"Winery Name Prep Segue: %@", _winery.name);
    }
}


@end
