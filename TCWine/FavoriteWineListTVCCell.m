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
    _descriptionTextView.layer.borderWidth = 2.0;
    _descriptionTextView.layer.borderColor = [UIColor colorWithRed:87.0f/255.0f green:60.0f/255.0f blue:131.0f/255.0f alpha:1.0f].CGColor;;
    _descriptionTextView.layer.cornerRadius = 10.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (IBAction)favoriteWineListCellEditButtonTapped:(id)sender {
    [self.delegate favoriteWineListCellTapped:self];
}



@end
