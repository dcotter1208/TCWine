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

-(void)foursquarePhotosAPI:(NSMutableArray *)photosArray {
    NSURL *url = [NSURL URLWithString:_foursquareAPIURLString];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (!error) {
            NSHTTPURLResponse *URLResponse = (NSHTTPURLResponse*) response;
            
            if (URLResponse.statusCode == 200) {
                NSError *JSONError;

                NSDictionary *foursquareJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSONError];

                if (!JSONError) {

                    NSMutableArray *jsonResponse = [foursquareJSON valueForKeyPath: @"response.photos.items"];
                                        
                    for (NSDictionary *foursquarePhotoData in jsonResponse) {
                        
                        NSString *prefix = [foursquarePhotoData valueForKey:@"prefix"];
                        NSString *size = @"450x450";
                        NSString *suffix = [foursquarePhotoData valueForKey:@"suffix"];
                        
                        Photo *photo = [Photo initWithPrefix:prefix size:size suffix:suffix];

                        NSLog(@"%@", photo.photoURLString);
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{

                    });
                    
                } else {
                    NSLog(@"ERROR with JSON");
                }
            } else {
                NSLog(@"STATUS CODE: %@", URLResponse);
            }
        } else {
            NSLog(@"ERROR with Network Call");
        }
        
    }];
    
    [dataTask resume];
}

@end
