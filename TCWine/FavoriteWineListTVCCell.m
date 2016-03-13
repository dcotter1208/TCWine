//
//  FavoriteWineListTVCCell.m
//  TCWine
//
//  Created by Donovan Cotter on 3/12/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FavoriteWineListTVCCell.h"

@implementation FavoriteWineListTVCCell


- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (IBAction)favoriteWineListCellEditButtonTapped:(id)sender {
    [self.delegate favoriteWineListCellTapped:self];
}

@end
