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
    NSLog(@"here is from map view= %@", _winery);
    
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = false;
    if (_passedAnnotation == NULL) {
        [self displayWineryDetails:_wineryFromTableview];
    } else {
        _winery = _passedAnnotation.wineryAtAnnotation;
        [self displayWineryDetails:_winery];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)displayWineryDetails:(Winery *)xwinery {
    self.wineryNameCellLabel.text = xwinery.name;
    self.wineryAddressLabel.text = xwinery.address;
    
    if (xwinery.phoneNumber == NULL){
        self.wineryPhoneLabel.text = @"Not Available";
    } else {
        self.wineryPhoneLabel.text = xwinery.phoneNumber;
    }
    
    if (xwinery.website == NULL){
        self.wineryWebsiteLabel.text = @"Not Available";
    } else {
        self.wineryWebsiteLabel.text = xwinery.website;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Called");
    if ([segue.identifier isEqual: @"containerViewSegue"]) {
        NSLog(@"Called 2");
        WineryPhotosCVC *wineryPhotosCVC = [segue destinationViewController];
        wineryPhotosCVC.winery = _winery;
        NSLog(@"%@", wineryPhotosCVC.winery);
        
    }
    
}



@end
