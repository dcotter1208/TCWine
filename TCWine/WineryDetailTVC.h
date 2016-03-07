//
//  WineryDetailTVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Winery.h"
#import "Annotation.h"
#import "FoursquarePhotosAPI.h"

@interface WineryDetailTVC : UITableViewController

@property(nonatomic, strong) Winery *winery;
@property(nonatomic, strong) Annotation *passedAnnotation;
@property(nonatomic, strong) NSMutableArray *photosArray;
@property(nonatomic, strong) NSString *wineryId;
@property(nonatomic, strong) NSString *clientSecret;
@property(nonatomic, strong) NSString *clientId;
@property(nonatomic, strong) NSString *venueId;

@end
