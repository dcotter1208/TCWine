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

@property (nonatomic, strong) WineryPhotosCVC *wineryPhotosCollectionViewController;

@end

@implementation WineryDetailTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = false;
    if (_passedAnnotation == NULL) {
        [self displayWineryDetails:_wineryFromTableview];
        NSLog(@"CALLED 1");
        NSLog(@"Winery Property From TableView View Set: %@", _winery);
    } else {
        _winery = _passedAnnotation.wineryAtAnnotation;
        NSLog(@"CALLED 2");
        NSLog(@"Winery Property From Map View Set: %@", _winery);
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

-(void)setWinery:(Winery *)winery {
    _winery = winery;
    self.title = winery.wineryId;
    // set the embedded WineryPhotosCVC's Model
    // (in case our Model, the winery, is set AFTER embedding happens)
    self.wineryPhotosCollectionViewController.winery = self.winery;
}



//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"Embedded Segue Called");
//    if ([segue.destinationViewController isKindOfClass:[WineryPhotosCVC class]]) {
//        WineryPhotosCVC *wineryPhotosCVC = (WineryPhotosCVC *)segue.destinationViewController;
//        wineryPhotosCVC.winery = _winery;
//        self.wineryPhotosCollectionViewController = wineryPhotosCVC;
//    } else {
//        [super prepareForSegue:segue sender:sender];
//    }
//}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqual: @"containerViewSegue"]) {
        NSLog(@"Embedded Segue Called");
        WineryPhotosCVC *wineryPhotosCVC = segue.destinationViewController;
        wineryPhotosCVC.winery = _winery;
        NSLog(@"%@", wineryPhotosCVC.winery);
        
    }
}



@end
