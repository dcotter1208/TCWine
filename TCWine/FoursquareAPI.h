//
//  FoursquareAPI.h
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Winery.h"
#import "Annotation.h"
#import <MapKit/MapKit.h>

@interface FoursquareAPI : NSObject

@property(nonatomic, strong) NSString *foursquareAPIURLString;

-(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID categoryId:(NSString*)categoryId;
+(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID categoryId:(NSString*)categoryId;

-(void)foursquareAPI:(NSMutableArray *)wineryArray mapView:(MKMapView *)mapView handler:(void(^)(NSDictionary *data))handler;
-(void)createAnnotation:(MKMapView *)mapView wineryArray:(NSMutableArray *)wineryArray;

@end
