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
    _descriptionTextView.layer.borderWidth = 1.0;
    _descriptionTextView.layer.borderColor = [UIColor blackColor].CGColor;
    _descriptionTextView.layer.cornerRadius = 10.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (IBAction)favoriteWineListCellEditButtonTapped:(id)sender {
    [self.delegate favoriteWineListCellTapped:self];
}



@end
