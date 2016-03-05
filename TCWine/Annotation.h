//
//  Annotation.h
//  TCWine
//
//  Created by Donovan Cotter on 3/5/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

-(id)initWithLocation:(CLLocationCoordinate2D)coordinate wineryName:(NSString *)wineryName wineryAddress:(NSString *)wineryAddress;
+(id)initWithLocation:(CLLocationCoordinate2D)coordinate wineryName:(NSString *)wineryName wineryAddress:(NSString *)wineryAddress;


@end
