//
//  Annotation.h
//  TCWine
//
//  Created by Donovan Cotter on 3/5/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Winery.h"

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic, strong) Winery *wineryAtAnnotation;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

-(id)initWithWinery:(Winery *)winery coordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle;
+(id)initWithWinery:(Winery *)winery coordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle;


@end
