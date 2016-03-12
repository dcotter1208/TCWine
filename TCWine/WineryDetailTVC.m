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
    
    NSLog(@"VC:%@", self.wineryPhotosCollectionViewController);
    
}

-(void)viewWillAppear:(BOOL)animated {
    
//    WineryPhotosCVC *wineryPhotosCVC = 
    
    self.navigationController.navigationBarHidden = false;
    
    WineryPhotosCVC *wineryPhotosCVC = self.childViewControllers[0];
    NSLog(@"CHILD: %@", wineryPhotosCVC);
    
    if (_passedAnnotation == NULL) {
        [self displayWineryDetails:_wineryFromTableview];
//        [self setWinery:_wineryFromTableview];
        wineryPhotosCVC.winery = self.wineryFromTableview;
        NSLog(@"Winery From TableView View: %@", _wineryFromTableview.name);
    } else {
        _winery = _passedAnnotation.wineryAtAnnotation;
        NSLog(@"Winery From Map View: %@", _winery.name);
        [self displayWineryDetails:_winery];
//        [self setWinery:_winery];
        wineryPhotosCVC.winery = self.winery;
        NSLog(@"Collection Winery: %@", wineryPhotosCVC.winery);
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


//-(void)setWinery:(Winery *)winery {
//    _winery = winery;
//    self.title = winery.wineryId;
//    // set the embedded WineryPhotosCVC's Model
//    // (in case our Model, the winery, is set AFTER embedding happens)
//    self.wineryPhotosCollectionViewController.winery = self.winery;
//}



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


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    if ([segue.identifier isEqual: @"containerViewSegue"]) {
//        NSLog(@"Embedded Segue Called");
//        WineryPhotosCVC *wineryPhotosCVC = segue.destinationViewController;
//        wineryPhotosCVC.winery = _winery;
//        NSLog(@"%@", wineryPhotosCVC.winery);
//        
//    }
//}

-(void)setWinery:(Winery *)winery {
    _winery = winery;
    self.wineryPhotosCollectionViewController.winery = winery;
}


@end
