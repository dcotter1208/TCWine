//
//  Winery.h
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Realm/Realm.h"

@interface Winery : RLMObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *phoneNumber;
@property(nonatomic, strong) NSString *website;
@property(nonatomic, strong) NSString *wineryDescription;
@property(nonatomic) double latitude;
@property(nonatomic) double longitude;
@property(nonatomic, strong) NSString *wineryId;

-(id)initWithWineryName:(NSString *)wineryName;
+(id)initWithWineryName:(NSString *)wineryName;


@end
