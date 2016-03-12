//
//  FavoriteWine.m
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FavoriteWine.h"

@implementation FavoriteWine

-(id)initWithWineName:(NSString *)wineName {
    self = [super init];
    
    if (self) {
        _name = wineName;
    }
    return self;
}


+(id)initWithWineName:(NSString *)wineName {
    return [[self alloc]initWithWineName:wineName];
}

+ (NSString *)primaryKey {
    return @"name";
}


@end
