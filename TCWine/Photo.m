//
//  Photo.m
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(id)initWithPrefix:(NSString *)prefix size:(NSString *)size suffix:(NSString *)suffix{
    self = [super init];
    
    if (self) {
        _prefix = prefix;
        _size = size;
        _suffix = suffix;
        
        _photoURLString = [NSString stringWithFormat:@"%@%@%@", _prefix, _size, _suffix];
    }
    return self;
}

+(id)initWithPrefix:(NSString *)prefix size:(NSString *)size suffix:(NSString *)suffix{
    return [[self alloc]initWithPrefix:prefix size:size suffix:suffix];
}

@end
