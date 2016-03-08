//
//  Photo.h
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property(nonatomic, strong) NSString *prefix;
@property(nonatomic, strong) NSString *size;
@property(nonatomic, strong) NSString *suffix;
@property(nonatomic, strong) NSString *photoURLString;

-(id)initWithPrefix:(NSString *)prefix size:(NSString *)size suffix:(NSString *)suffix;
+(id)initWithPrefix:(NSString *)prefix size:(NSString *)size suffix:(NSString *)suffix;

@end
