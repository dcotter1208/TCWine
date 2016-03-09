//
//  FoursquarePhotosAPI.m
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FoursquarePhotosAPI.h"

@implementation FoursquarePhotosAPI

-(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID venueId:(NSString*)venueId{
    self = [super init];
    
    if (self) {
        
        _foursquareAPIURLString = [NSString stringWithFormat: @"https://api.foursquare.com/v2/venues/%@/photos?&group=venue&limit=150&v=20130815&client_id=%@&client_secret=%@", venueId, clientID, clientSecret];
    }
    return self;
}

+(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID venueId:(NSString*)venueId {
    return [[self alloc]initWithClientSecret:clientSecret clientID:clientID venueId:venueId];
}

-(void)foursquarePhotosAPI:(void(^)(NSDictionary *data))handler{
    
    NSURL *url = [NSURL URLWithString:_foursquareAPIURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *foursquareData = [responseObject valueForKeyPath:@"response.photos.items"];
        handler(foursquareData);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Network Operation Failed");
    }];

    [operation start];
}

-(void)getPhotoFromURL{
    
}

@end
