//
//  FavoriteWineEntryTVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FavoriteWineDelegate <NSObject>

-(void)sendFavoriteWineInfoToAddFavWineVC:(NSString*)wineName Winery:(NSString *)winery category:(NSString *)category year:(NSString *) year note:(NSString *)note;

@end

@interface FavoriteWineEntryTVC : UITableViewController

@property (nonatomic, strong) NSString *wineCategoryForSegmentedControl;
@property(nonatomic, weak) id<FavoriteWineDelegate>delegate;


@end
