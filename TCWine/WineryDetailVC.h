//
//  WineryDetailVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/5/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Winery.h"
#import "Annotation.h"

@interface WineryDetailVC : UIViewController

@property(nonatomic, strong) Winery *winery;
@property(nonatomic, strong) Annotation *passedAnnotation;

@end
