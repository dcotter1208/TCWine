//
//  FoursquarePhotoURLRequest.m
//  TCWine
//
//  Created by Donovan Cotter on 3/13/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FoursquarePhotoURLRequest.h"

@implementation FoursquarePhotoURLRequest

-(id)initWithURLString:(NSString *)URLString {
    self = [super init];
    
    if (self) {
        _URLString = URLString;
    }
    return self;
}

+(id)initWithURLString:(NSString *)URLString {
    return [[self alloc]initWithURLString:URLString];
}

-(void)foursquarePhotoURLRequest:(UIImageView *)imageView handler:(void(^)(UIImage *data))handler {
    NSURL *URL = [NSURL URLWithString:_URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [imageView setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"Grapes"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (response.statusCode == 200) {
            handler(image);
        }
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        if (response.statusCode !=200) {
            NSLog(@"%ld", (long)response.statusCode);
            
        } else {
            NSLog(@"%@", error);
        }
    }];
    
}




@end
