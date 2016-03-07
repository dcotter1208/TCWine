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

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

-(void)displayWineryDetails{
    self.wineryNameCellLabel.text = _winery.name;
    self.wineryAddressLabel.text = _winery.address;
    self.wineryPhoneLabel.text = _winery.phoneNumber;
    self.wineryWebsiteLabel.text = _winery.website;
}


@end
