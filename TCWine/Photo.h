//
//  Photo.h
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

@interface Photo : RLMObject

@property(nonatomic, strong) NSString *prefix;
@property(nonatomic, strong) NSString *size;
@property(nonatomic, strong) NSString *suffix;
@property(nonatomic, strong) NSString *photoURLString;
@property(nonatomic, strong) NSString *wineryId;

-(id)initWithPrefix:(NSString *)prefix size:(NSString *)size suffix:(NSString *)suffix wineryId:(NSString *)wineryId;
+(id)initWithPrefix:(NSString *)prefix size:(NSString *)size suffix:(NSString *)suffix wineryId:(NSString *)wineryId;

@end
