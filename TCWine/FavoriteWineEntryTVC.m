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
@property (strong, nonatomic) IBOutlet UITableView *containerTableView;

@end

@implementation FavoriteWineEntryTVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.segmentedControlOne.selectedSegmentIndex = -1;
    self.segmentedControlTwo.selectedSegmentIndex = -1;

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _favoriteWineryId = _winery.wineryId;
    
    if (_favoriteWineToEdit == nil) {
        _wineryTextField.text = _winery.name;
        _uniqueWineId = [[NSUUID UUID] UUIDString];
    } else {
        _wineTextField.text = _favoriteWineToEdit.name;
        _wineryTextField.text = _favoriteWineToEdit.winery;
        _yearTextField.text = _favoriteWineToEdit.year;
        _descriptionTextField.text = _favoriteWineToEdit.note;
        _uniqueWineId = _favoriteWineToEdit.uniqueWineId;
        [self setSegmentedControlBasedOnWineCategoryInEditMode];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated {

    if (_favoriteWineToEdit == nil) {
        
    [self.delegate sendFavoriteWineInfoToAddFavWineVC:self.wineTextField.text Winery:self.wineryTextField.text category:_wineCategoryForSegmentedControl year:self.yearTextField.text note:self.descriptionTextField.text wineryId:_favoriteWineryId uniqueWineId:(NSString *)_uniqueWineId];
    } else {
    [self.delegate sendFavoriteWineInfoToAddFavWineVC:self.wineTextField.text Winery:self.wineryTextField.text category:_wineCategoryForSegmentedControl year:self.yearTextField.text note:self.descriptionTextField.text wineryId:_favoriteWineToEdit.wineryId uniqueWineId:(NSString *)_uniqueWineId];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.containerTableView endEditing:true];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)segmentedControlOnePressed:(id)sender {
    
    NSInteger selectedIndex = self.segmentedControlOne.selectedSegmentIndex;
    
    switch (selectedIndex) {
        case 0:
            _wineCategoryForSegmentedControl = @"Red";
            self.segmentedControlTwo.selectedSegmentIndex = -1;
            break;
        case 1:
            _wineCategoryForSegmentedControl = @"White";
            self.segmentedControlTwo.selectedSegmentIndex = -1;
            break;
        case 2:
            _wineCategoryForSegmentedControl = @"Rosé";
            self.segmentedControlTwo.selectedSegmentIndex = -1;
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
            break;
        case 1:
            _wineCategoryForSegmentedControl = @"Dessert";
            self.segmentedControlOne.selectedSegmentIndex = -1;
            break;
        case 2:
            _wineCategoryForSegmentedControl = @"Fortified";
            self.segmentedControlOne.selectedSegmentIndex = -1;
            break;
        default:
            break;
    }
}

-(void)setSegmentedControlBasedOnWineCategoryInEditMode {
    if ([_favoriteWineToEdit.category isEqualToString: @"Red"]) {
        _segmentedControlOne.selectedSegmentIndex = 0;
        _wineCategoryForSegmentedControl = @"Red";
    } else if ([_favoriteWineToEdit.category isEqualToString:@"White"]) {
        _segmentedControlOne.selectedSegmentIndex = 1;
        _wineCategoryForSegmentedControl = @"White";
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Rosé"]) {
        _segmentedControlOne.selectedSegmentIndex = 2;
        _wineCategoryForSegmentedControl = @"Rosé";
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Sparkling"]) {
        _segmentedControlTwo.selectedSegmentIndex = 0;
        _wineCategoryForSegmentedControl = @"Sparkling";
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Dessert"]) {
        _segmentedControlTwo.selectedSegmentIndex = 1;
        _wineCategoryForSegmentedControl = @"Dessert";
    } else if ([_favoriteWineToEdit.category isEqualToString:@"Fortified"]) {
        _segmentedControlTwo.selectedSegmentIndex = 2;
        _wineCategoryForSegmentedControl = @"Fortified";
    }
}


@end
