//
//  FullImageVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/13/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "Photo.h"
#import "Winery.h"
#import "UIImageView+AFNetworking.h"


@interface FullImageVC : UIViewController


@property(nonatomic, strong) Photo *selectedPhoto;
@property(nonatomic, strong) Winery *winery;

@end
