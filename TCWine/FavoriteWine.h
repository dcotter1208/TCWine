//
//  FavoriteWine.h
//  TCWine
//
//  Created by Donovan Cotter on 3/4/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

@interface FavoriteWine : RLMObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *winery;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *wineryId;

-(id)initWithWineName:(NSString *)wineName;
+(id)initWithWineName:(NSString *)wineName;


@end
