//
//  FavoriteWineListVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/9/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteWine.h"
#import "AddFavoriteWineVC.h"
#import "Winery.h"
#import "Realm/Realm.h"


@interface FavoriteWineListTVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) FavoriteWine *favoriteWine;
@property (nonatomic, strong) RLMResults *favoriteWinesForWineryArray;
@property (nonatomic, strong) Winery *winery;
@property (nonatomic, strong) FavoriteWine *selectedFavoriteWine;


@end
