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
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlOne;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlTwo;

@end

@implementation FavoriteWineEntryTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.segmentedControlOne.selectedSegmentIndex = -1;
    self.segmentedControlTwo.selectedSegmentIndex = -1;

}

-(void)viewWillAppear:(BOOL)animated {
    _favoriteWineryId = _winery.wineryId;
    
    if (_favoriteWineToEdit == nil) {
        _wineryTextField.text = _winery.name;
    } else {
        _wineTextField.text = _favoriteWineToEdit.name;
        _wineryTextField.text = _favoriteWineToEdit.winery;
        _yearTextField.text = _favoriteWineToEdit.year;
        _descriptionTextField.text = _favoriteWineToEdit.note;
        [self setSegmentedControlBasedOnWineCategoryInEditMode];
    }
}

-(void)viewWillDisappear:(BOOL)animated {

    [self.delegate sendFavoriteWineInfoToAddFavWineVC:self.wineTextField.text Winery:self.wineryTextField.text category:_wineCategoryForSegmentedControl year:self.yearTextField.text note:self.descriptionTextField.text wineryId:_favoriteWineryId];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    return _descriptionTextField.text.length + (text.length - range.length) <= 140;
}


- (IBAction)segmentedControlOnePressed:(id)sender {
    
    NSInteger selectedIndex = self.segmentedControlOne.selectedSegmentIndex;
    
    switch (selectedIndex) {
        case 0:
            _wineCategoryForSegmentedControl = @"Red";
            self.segmentedControlTwo.selectedSegmentIndex = -1;
            NSLog(@"%@", _wineCategoryForSegmentedControl);
            break;
        case 1:
            _wineCategoryForSegmentedControl = @"White";
            self.segmentedControlTwo.selectedSegmentIndex = -1;
            NSLog(@"%@", _wineCategoryForSegmentedControl);
            break;
        case 2:
            _wineCategoryForSegmentedControl = @"Rosé";
            self.segmentedControlTwo.selectedSegmentIndex = -1;
            NSLog(@"%@", _wineCategoryForSegmentedControl);
            break;
        default:
            break;
    }
    
}

- (IBAction)segmentedControlTwoPressed:(id)sender {
    
    NSInteger selectedIndex = self.segmentedControlTwo.selectedSegmentIndex;
    
    switch (selectedIndex) {
        case 0:
            _wineCategoryForSegmentedControl = @"Sparkling";
            self.segmentedControlOne.selectedSegmentIndex = -1;
            NSLog(@"%@", _wineCategoryForSegmentedControl);
            break;
        case 1:
            _wineCategoryForSegmentedControl = @"Dessert";
            self.segmentedControlOne.selectedSegmentIndex = -1;
            NSLog(@"%@", _wineCategoryForSegmentedControl);
            break;
        case 2:
            _wineCategoryForSegmentedControl = @"Fortified";
            self.segmentedControlOne.selectedSegmentIndex = -1;
            NSLog(@"%@", _wineCategoryForSegmentedControl);
            break;
        default:
            break;
    }
}

-(void)setSegmentedControlBasedOnWineCategoryInEditMode {
    if ([_favoriteWineToEdit.category isEqualToString: @"Red"]) {
        _segmentedControlOne.selectedSegmentIndex = 0;
    } else if ([_favoriteWineToEdit.category isEqualToString:@"White"]) {
        _segmentedControlOne.selectedSegmentIndex = 1;
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Rosé"]) {
        _segmentedControlOne.selectedSegmentIndex = 2;
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Sparkling"]) {
        _segmentedControlTwo.selectedSegmentIndex = 0;
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Dessert"]) {
        _segmentedControlTwo.selectedSegmentIndex = 1;
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Fortified"]) {
        _segmentedControlTwo.selectedSegmentIndex = 2;
    }
}



@end
