//
//  FavoriteWineListVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/9/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteWine.h"
#import "Winery.h"
#import "Realm/Realm.h"


@interface FavoriteWineListVC : UIViewController

@property (nonatomic, strong) FavoriteWine *favoriteWine;
@property (nonatomic, strong) RLMResults *favoriteWinesForWineryArray;
@property (nonatomic, strong) Winery *winery;


@end
