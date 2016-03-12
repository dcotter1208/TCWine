//
//  WineryPhotosCVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/11/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoursquarePhotosAPI.h"
#import "Winery.h"
#import "Photo.h"
#import "UIImageView+AFNetworking.h"

@interface WineryPhotosCVC : UICollectionViewController

@property(nonatomic, strong) Photo *photo;
@property(nonatomic, strong) NSMutableArray *foursquarePhotoArray;
@property(nonatomic, strong) NSDictionary *foursquarePhotoData;
@property(nonatomic, strong) NSString *photoURL;
@property(nonatomic, strong) Winery *winery;
@property(nonatomic, strong) NSString *venueId;
@property(nonatomic, strong) NSString *clientSecret;
@property(nonatomic, strong) NSString *clientId;
@property(nonatomic) CGFloat collectionViewWidth;
@property(nonatomic) CGFloat collectionViewHeight;

@end
