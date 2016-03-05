//
//  FoursquareAPI.h
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Winery.h"

@interface FoursquareAPI : NSObject

@property(nonatomic, strong) NSString *foursquareAPIURLString;

-(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID categoryId:(NSString*)categoryId;
+(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID categoryId:(NSString*)categoryId;

-(void)foursquareAPI:(NSMutableArray*)wineryArray;

@end


// NSString *foursquareURL = @"https://api.foursquare.com/v2/venues/search?ll=44.7681,-85.6222&categoryId=4bf58dd8d48988d14b941735&v=20130815&client_id=ICKPUV0E20DW1NOOGWGW1S0U3B2EAJEYJ2XF02VIW0CXTPTT&client_secret=5M4R4U4ZOBZCURJPVXBUAGKCDRGAUPN3IGT12PD54LUYQ5VM";

