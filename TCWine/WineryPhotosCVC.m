//
//  WineryPhotosCVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/11/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryPhotosCVC.h"

@interface WineryPhotosCVC ()

@end

@implementation WineryPhotosCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _foursquarePhotoArray = [NSMutableArray array];
     _foursquarePhotoData = [NSDictionary dictionary];
    
    NSLog(@"Collection: %@", _winery);
    
    _clientSecret = @"5M4R4U4ZOBZCURJPVXBUAGKCDRGAUPN3IGT12PD54LUYQ5VM";
    _clientId = @"ICKPUV0E20DW1NOOGWGW1S0U3B2EAJEYJ2XF02VIW0CXTPTT";
    _venueId = _winery.wineryId;
    
    [self getFoursquarePhotos];
    [self collectionViewLayout];


//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)setWinery:(Winery *)winery {
//    _winery = winery;
//    self.title = winery.wineryId;
//    
//}


#pragma mark <UICollectionViewDataSource>

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
            NSLog(@"%lu", _foursquarePhotoArray.count);
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.collectionView reloadData];
            
        });
    }];
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

/*
 
 
 *********FROM TVC**********

 
 
 
 -(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
 
 int numberOfCellInRow = 5;
 CGFloat cellWidth = collectionView.bounds.size.width/numberOfCellInRow;
 return CGSizeMake(cellWidth, cellWidth);
 }
 

 
 -(void)collectionViewLayout{
 
 CGFloat collectionViewWidth = self.collectionView.bounds.size.width;
 CGFloat collectionViewHeight = self.collectionView.bounds.size.height;
 
 UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
 layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
 layout.itemSize = CGSizeMake(collectionViewWidth/3, collectionViewHeight/3);
 layout.minimumInteritemSpacing = 1;
 layout.minimumLineSpacing = 1;
 }

 
 */

@end
