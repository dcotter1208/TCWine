//
//  Winery.m
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "Winery.h"

@implementation Winery

-(id)initWithWineryName:(NSString *)wineryName {
    self = [super init];
    
    if (self) {
        _name = wineryName;
    }
    return self;
}

+(id)initWithWineryName:(NSString *)wineryName {
    return [[self alloc]initWithWineryName:wineryName];
}


@end
