//
//  WineMapVC.h
//  TCWine
//
//  Created by Donovan Cotter on 3/2/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WineMapVC : UIViewController {

    MKMapView *mapView;

}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end
