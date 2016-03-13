//
//  FavoriteWineEntryTVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Winery.h"

@protocol FavoriteWineDelegate <NSObject>

-(void)sendFavoriteWineInfoToAddFavWineVC:(NSString*)wineName Winery:(NSString *)winery category:(NSString *)category year:(NSString *) year note:(NSString *)note wineryId:(NSString *)wineryId;

@end

@interface FavoriteWineEntryTVC : UITableViewController <UITextViewDelegate>

@property (nonatomic, strong) NSString *wineCategoryForSegmentedControl;
@property (nonatomic, strong) Winery *winery;
@property (nonatomic, strong) NSString *favoriteWineryId;

@property(nonatomic, weak) id<FavoriteWineDelegate>delegate;


@end
