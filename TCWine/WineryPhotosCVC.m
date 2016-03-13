//
//  WineryPhotosCVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/11/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryPhotosCVC.h"
#import "WineryDetailTVC.h"

@interface WineryPhotosCVC ()

@end

@implementation WineryPhotosCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionViewWidth = self.collectionView.bounds.size.width;
    _collectionViewHeight = self.collectionView.bounds.size.height;
    
     _foursquarePhotoArray = [NSMutableArray array];
     _foursquarePhotoData = [NSDictionary dictionary];
    
    _clientSecret = @"5M4R4U4ZOBZCURJPVXBUAGKCDRGAUPN3IGT12PD54LUYQ5VM";
    _clientId = @"ICKPUV0E20DW1NOOGWGW1S0U3B2EAJEYJ2XF02VIW0CXTPTT";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    WineryDetailTVC *wineryDetailTVC;
    wineryDetailTVC.winery = self.winery;
    
    _venueId = self.winery.wineryId;
    
    [self getFoursquarePhotos];

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
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

-(void)getFoursquarePhotos {
    
    FoursquarePhotosAPI *foursquarePhotoAPI = [FoursquarePhotosAPI initWithClientSecret:_clientSecret clientID:_clientId venueId:_venueId];
    
    [foursquarePhotoAPI foursquarePhotosAPI:^(NSDictionary *data) {
        
        _foursquarePhotoData = data;
        
        for (NSDictionary *foursquarePhotos in _foursquarePhotoData) {
            _photo = [Photo initWithPrefix:[foursquarePhotos valueForKey:@"prefix"] size:@"450x450" suffix:[foursquarePhotos valueForKey:@"suffix"]];
            [_foursquarePhotoArray addObject:_photo];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
    
}


@end
