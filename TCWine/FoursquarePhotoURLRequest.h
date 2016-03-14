//
//  FoursquarePhotoURLRequest.h
//  TCWine
//
//  Created by Donovan Cotter on 3/13/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+AFNetworking.h"

@interface FoursquarePhotoURLRequest : NSObject

@property (nonatomic, strong) NSString *URLString;

-(id)initWithURLString:(NSString *)URLString;
+(id)initWithURLString:(NSString *)URLString;

-(void)foursquarePhotoURLRequest:(UIImageView *)imageView handler:(void(^)(UIImage *data))handler;

@end
