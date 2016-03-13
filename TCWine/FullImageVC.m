//
//  FullImageVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/13/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "FullImageVC.h"

@interface FullImageVC ()

@property (weak, nonatomic) IBOutlet UIImageView *fullImageView;

@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation FullImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_fullImageView setImageWithURL:[NSURL URLWithString:_selectedPhoto.photoURLString] placeholderImage:[UIImage imageNamed:@"ImagePlaceholder"]];
    
    NSLog(@"WINERY NAME: %@", _winery.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissFullImageVC:(id)sender {
    
    [self dismissViewControllerAnimated:TRUE completion:nil];

}

-(void)viewWillLayoutSubviews {
    
    _dismissButton.layer.cornerRadius = _dismissButton.frame.size.width / 2;
    _dismissButton.layer.opacity = .80;

    
}


@end
