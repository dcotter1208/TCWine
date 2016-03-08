//
//  FoursquarePhotosAPI.h
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface FoursquarePhotosAPI : NSObject

@property(nonatomic, strong) NSString *foursquareAPIURLString;

-(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID venueId:(NSString*)venueId;
+(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID venueId:(NSString*)venueId;

// handler:(void(^)(NSError*, NSDictionary *data))handler
-(void)foursquarePhotosAPI:(void(^)(NSDictionary *data))handler;

@end
