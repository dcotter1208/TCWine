//
//  Annotation.m
//  TCWine
//
//  Created by Donovan Cotter on 3/5/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

-(id)initWithLocation:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle{
    self = [super init];
    
    if (self) {
        _title = title;
        _subtitle = subtitle;
        _coordinate = coordinate;

    }
    return self;
}

+(id)initWithLocation:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle{
    return [[self alloc]initWithLocation:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle];
}


@end
