//
//  Annotation.m
//  TCWine
//
//  Created by Donovan Cotter on 3/5/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

-(id)initWithLocation:(CLLocationCoordinate2D)coordinate wineryName:(NSString *)wineryName wineryAddress:(NSString *)wineryAddress{
    self = [super init];
    
    if (self) {
        _coordinate = coordinate;
        _title = wineryName;
        _subtitle = wineryAddress;
    }
    return self;
}

+(id)initWithLocation:(CLLocationCoordinate2D)coordinate wineryName:(NSString *)wineryName wineryAddress:(NSString *)wineryAddress{
    return [[self alloc]initWithLocation:coordinate wineryName:wineryName wineryAddress:wineryAddress];
}


@end
