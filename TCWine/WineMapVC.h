//
//  WineMapVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/2/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoursquareAPI.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "Realm/Realm.h"
#import "Winery.h"

@interface WineMapVC : UIViewController {

    RLMResults *wineryArray;
    RLMRealm *realm;
}

//@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property(nonatomic, strong) NSString *clientSecret;
@property(nonatomic, strong) NSString *clientId;
@property(nonatomic, strong) NSString *categoryId;
@property(nonatomic, strong) FoursquareAPI *foursquareAPI;
@property(nonatomic, strong) Winery *winery;
@property(nonatomic) int distanceSpan;
@property(nonatomic) MKCoordinateRegion viewRegion;
@property(nonatomic, strong) Annotation *selectedAnnotation;


@end
