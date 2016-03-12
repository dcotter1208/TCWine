//
//  FavoriteWineEntryTVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FavoriteWineEntryTVC.h"

@interface FavoriteWineEntryTVC ()
@property (weak, nonatomic) IBOutlet UITextField *wineryTextField;
@property (weak, nonatomic) IBOutlet UITextField *wineTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;

@end

@implementation FavoriteWineEntryTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)viewWillDisappear:(BOOL)animated {

    [self.delegate sendFavoriteWineInfoToAddFavWineVC:self.wineTextField.text Winery:self.wineryTextField.text category:_wineCategoryForSegmentedControl year:self.yearTextField.text note:self.descriptionTextField.text];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
