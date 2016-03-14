//
//  WineryPhotosCVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/11/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryPhotosCVC.h"
#import "WineryDetailTVC.h"
#import "FullImageVC.h"

@interface WineryPhotosCVC ()

@end

@implementation WineryPhotosCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self collectionViewSetup];
    
     _foursquarePhotoArray = [NSMutableArray array];
     _foursquarePhotoData = [NSDictionary dictionary];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"keyList" ofType:@"plist"];
    NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    _clientSecret = configuration[@"FoursquareAPI"][@"ClientSecret"];
    _clientId = configuration[@"FoursquareAPI"][@"ClientID"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {

    if (_passedAnnotation == nil) {
        _venueId = self.winery.wineryId;
        _wineryPhotosArray = [Photo objectsWhere:@"wineryId = %@", _venueId];
        [self getFoursquarePhotos];
    } else {
        _venueId = _passedAnnotation.wineryAtAnnotation.wineryId;
        _winery = _passedAnnotation.wineryAtAnnotation;
        _wineryPhotosArray = [Photo objectsWhere:@"wineryId = %@", _venueId];
        [self getFoursquarePhotos];
    }

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _wineryPhotosArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"photoCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *wineryImageView = (UIImageView *)[cell viewWithTag:100];

    _photo = [_wineryPhotosArray objectAtIndex:indexPath.row];
    
    [wineryImageView setImageWithURL:[NSURL URLWithString:_photo.photoURLString] placeholderImage:[UIImage imageNamed:@"Grapes"]];

    return cell;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat screenWidth = CGRectGetWidth(self.collectionView.bounds);
    CGFloat cellWidth = screenWidth/4;
    
    return CGSizeMake(cellWidth, cellWidth);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

    return 0;
}


-(void)getFoursquarePhotos {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    
    FoursquarePhotosAPI *foursquarePhotoAPI = [FoursquarePhotosAPI initWithClientSecret:_clientSecret clientID:_clientId venueId:_venueId];
    
    [foursquarePhotoAPI foursquarePhotosAPI:^(NSDictionary *data) {
        
        for (NSDictionary *foursquarePhotos in data) {
            
            _photo = [Photo initWithPrefix:[foursquarePhotos valueForKey:@"prefix"] size:[NSString stringWithFormat:@"%@x%@", [foursquarePhotos valueForKey:@"height"], [foursquarePhotos valueForKey:@"width"]] suffix:[foursquarePhotos valueForKey:@"suffix"]wineryId:_venueId];
                [realm addOrUpdateObject:_photo];
        }
        
        [realm commitWriteTransaction];
        [self.collectionView reloadData];
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"showImageFullSize"]) {
        UICollectionViewCell *cell = (UICollectionViewCell *)sender;
        FullImageVC *fullImageVC = (FullImageVC *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        
        fullImageVC.selectedPhoto = [_wineryPhotosArray objectAtIndex:indexPath.row];
        fullImageVC.winery = _winery;
       
    }
    
}

-(void)collectionViewSetup{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [flowLayout setItemSize:CGSizeMake(50.0f, 50.0f)];
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.layer.cornerRadius = 10.0;
    self.collectionView.layer.borderWidth = 2.5;
    self.collectionView.layer.borderColor = [UIColor blackColor].CGColor;
    
}


@end
