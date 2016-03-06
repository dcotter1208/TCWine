//
//  WineMapVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/2/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineMapVC.h"
#import "WineryDetailVC.h"

@interface WineMapVC ()

@end

@implementation WineMapVC

@synthesize mapView = mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
        
    CLLocationCoordinate2D mapZoomLocation;
    mapZoomLocation.latitude = 44.954;
    mapZoomLocation.longitude = -85.615;
    _distanceSpan = 55000;
    
    _viewRegion = MKCoordinateRegionMakeWithDistance(mapZoomLocation, _distanceSpan, _distanceSpan);
    [mapView setRegion:_viewRegion];

    _wineryArray = [NSMutableArray array];
    
    _clientSecret = @"5M4R4U4ZOBZCURJPVXBUAGKCDRGAUPN3IGT12PD54LUYQ5VM";
    _clientId = @"ICKPUV0E20DW1NOOGWGW1S0U3B2EAJEYJ2XF02VIW0CXTPTT";
    _categoryId = @"4bf58dd8d48988d14b941735";

    _foursquareAPI = [FoursquareAPI initWithClientSecret: _clientSecret clientID:_clientId categoryId: _categoryId];

    [_foursquareAPI foursquareAPI:_wineryArray mapView:mapView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    MKPinAnnotationView *newAnnotation = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    newAnnotation.canShowCallout = YES;
    newAnnotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return newAnnotation;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"PIN TAPPED");
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"Window TAPPEd");

}

//- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
//    
//    NSLog(@"Annotation Window Tapped");
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//     WineryDetailVC *viewController = (WineryDetailVC *)[storyboard instantiateViewControllerWithIdentifier:@"wineryDetailVC"];
//    
//    [self presentViewController:viewController animated:YES completion:nil];
//
//    NSLog(@"view.annotation.title: %@", view.annotation.title); // SHOWS THE TITLE
//
//}


@end
