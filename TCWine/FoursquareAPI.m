//
//  FoursquareAPI.m
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FoursquareAPI.h"

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

-(void)foursquareAPI:(void(^)(NSDictionary *data))handler {
    
    NSURL *url = [NSURL URLWithString:_foursquareAPIURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *jsonResponse = [responseObject valueForKeyPath: @"response.venues"];
        handler(jsonResponse);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Network Operation Failed");
    }];
    
    [operation start];
}

-(void)createAnnotation:(MKMapView *)mapView {

    RLMResults *wineryArray = [Winery allObjects];
    
    for (Winery *winery in wineryArray) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(winery.latitude, winery.longitude);
        Annotation *annotation = [Annotation initWithWinery:winery coordinate:coordinate title:winery.name subtitle:winery.address];
        
        [mapView addAnnotation:annotation];
    }
}

@end
