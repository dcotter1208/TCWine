//
//  FoursquareAPI.m
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FoursquareAPI.h"

//
//NSString *foursquareURL = @"https://api.foursquare.com/v2/venues/search?ll=44.7681,-85.6222&categoryId=4bf58dd8d48988d14b941735&v=20130815&client_id=ICKPUV0E20DW1NOOGWGW1S0U3B2EAJEYJ2XF02VIW0CXTPTT&client_secret=5M4R4U4ZOBZCURJPVXBUAGKCDRGAUPN3IGT12PD54LUYQ5VM";
//
//

@implementation FoursquareAPI

-(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID categoryId:(NSString*)categoryId{
    self = [super init];
    
    if (self) {

        _foursquareAPIURLString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=44.7681,-85.6222&categoryId=%@&v=20130815&client_id=%@&client_secret=%@", categoryId, clientID, clientSecret];
    }
    
    return self;
}

+(id)initWithClientSecret:(NSString *)clientSecret clientID:(NSString *)clientID categoryId:(NSString*)categoryId{
    return [[self alloc]initWithClientSecret:clientSecret clientID:clientID categoryId:categoryId];
    }

-(void)foursquareAPI {
    NSURL *url = [NSURL URLWithString:_foursquareAPIURLString];
    NSLog(@"URL: %@", url);
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            NSHTTPURLResponse *URLResponse = (NSHTTPURLResponse*) response;
            
            if (URLResponse.statusCode == 200) {
                NSError *JSONError;
                
                NSDictionary *foursquareJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSONError];
                
                if (!JSONError) {
                    NSLog(@"%@", foursquareJSON);
                } else {
                    NSLog(@"ERROR with JSON");
                }
            }
        } else {
            NSLog(@"ERROR with Network Call");
        }
        
    }];

    [dataTask resume];
}

@end
