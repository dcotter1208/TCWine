//
//  WineryListVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/7/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Realm/Realm.h"
#import "Winery.h"
#import "WineMapVC.h"

@interface WineryListVC : UIViewController

@property (nonatomic, strong) RLMResults *listWineryArray;

@end
