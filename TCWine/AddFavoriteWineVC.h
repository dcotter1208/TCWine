//
//  AddFavoriteWineVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteWineEntryTVC.h"
#import "FavoriteWine.h"

@interface AddFavoriteWineVC : UIViewController <FavoriteWineDelegate>

@property (nonatomic, strong) FavoriteWine *favoriteWine;
@property (nonatomic, strong) FavoriteWine *favoriteWineToEdit;
@property (nonatomic, strong) Winery *winery;

@end
