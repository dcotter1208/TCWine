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
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation WineryDetailTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = false;

    _foursquarePhotoArray = [NSMutableArray array];
    _foursquarePhotoData = [NSDictionary dictionary];

    _winery = _passedAnnotation.wineryAtAnnotation;
    
    [self displayWineryDetails];    
    
    _clientSecret = @"5M4R4U4ZOBZCURJPVXBUAGKCDRGAUPN3IGT12PD54LUYQ5VM";
    _clientId = @"ICKPUV0E20DW1NOOGWGW1S0U3B2EAJEYJ2XF02VIW0CXTPTT";
    _venueId = _winery.wineryId;
    
    [self getFoursquarePhotos];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _foursquarePhotoArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"photoCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        
    UIImageView *wineryImageView = (UIImageView *)[cell viewWithTag:100];
    
    Photo *photo = [_foursquarePhotoArray objectAtIndex:indexPath.row];
    dispatch_async(dispatch_get_main_queue(), ^{
        [wineryImageView setImageWithURL:[NSURL URLWithString:photo.photoURLString] placeholderImage:[UIImage imageNamed:@"Grapes"]];
    });
    
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
}

-(void)displayWineryDetails{
    self.wineryNameCellLabel.text = _winery.name;
    self.wineryAddressLabel.text = _winery.address;
    
    if (_winery.phoneNumber == NULL){
        self.wineryPhoneLabel.text = @"Not Available";
    } else {
        self.wineryPhoneLabel.text = _winery.phoneNumber;
    }
    
    if (_winery.website == NULL){
        self.wineryWebsiteLabel.text = @"Not Available";
    } else {
        self.wineryWebsiteLabel.text = _winery.website;
    }
    
}

-(void)getFoursquarePhotos {

    FoursquarePhotosAPI *foursquarePhotoAPI = [FoursquarePhotosAPI initWithClientSecret:_clientSecret clientID:_clientId venueId:_venueId];
    
    [foursquarePhotoAPI foursquarePhotosAPI:^(NSDictionary *data) {
       
        _foursquarePhotoData = data;
        
        for (NSDictionary *foursquarePhotos in _foursquarePhotoData) {
            _photo = [Photo initWithPrefix:[foursquarePhotos valueForKey:@"prefix"] size:@"450x450" suffix:[foursquarePhotos valueForKey:@"suffix"]];
            [_foursquarePhotoArray addObject:_photo];
            NSLog(@"%lu", _foursquarePhotoArray.count);
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
//            _foursquareMaxTenItemsArray = [_foursquarePhotoArray subarrayWithRange:NSMakeRange(0, 10)];
//            NSLog(@"%lu", _foursquareMaxTenItemsArray.count);
            [self.collectionView reloadData];
            
        });
    }];
    
    
}


@end
