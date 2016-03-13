//
//  FavoriteWineListTVCCell.h
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteWine.h"

@protocol CustomCellDelegate <NSObject>

-(void)favoriteWineListCellTapped:(id)sender;

@end

@interface FavoriteWineListTVCCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *wineNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property(nonatomic, weak) id<CustomCellDelegate>delegate;

@end
