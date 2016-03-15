//
//  WineryPhotosCVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/11/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoursquarePhotosAPI.h"
#import "FoursquarePhotoURLRequest.h"
#import "Winery.h"
#import "Photo.h"
#import "Annotation.h"
#import "UIImageView+AFNetworking.h"
#import "Realm/Realm.h"

@interface WineryPhotosCVC : UICollectionViewController

@property (nonatomic, strong) RLMResults *wineryPhotosArray;
@property(nonatomic, strong) Photo *photo;
@property(nonatomic, strong) Annotation *passedAnnotation;
@property(nonatomic, strong) NSString *photoURL;
@property(nonatomic, strong) Winery *winery;
@property(nonatomic, strong) NSString *venueId;
@property(nonatomic, strong) NSString *clientSecret;
@property(nonatomic, strong) NSString *clientId;
@property(nonatomic) CGFloat collectionViewWidth;
@property(nonatomic) CGFloat collectionViewHeight;


@end
