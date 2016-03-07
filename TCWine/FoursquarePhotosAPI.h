//
//  FoursquarePhotosAPI.h
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoursquarePhotosAPI : NSObject

@property(nonatomic, strong) NSString *foursquareAPIURLString;

-(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID venueId:(NSString*)venueId;
+(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID venueId:(NSString*)venueId;

-(void)foursquarePhotosAPI:(NSMutableArray *)photosArray;

@end
