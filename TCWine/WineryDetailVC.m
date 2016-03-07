//
//  WineryDetailVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/5/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineryDetailVC.h"

@interface WineryDetailVC ()

@end

@implementation WineryDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = false;

    _winery = _passedAnnotation.wineryAtAnnotation;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
