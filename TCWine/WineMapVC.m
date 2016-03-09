//
//  WineMapVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/2/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineMapVC.h"
#import "WineryDetailTVC.h"

@interface WineMapVC ()

@end

@implementation WineMapVC

@synthesize mapView = mapView;

- (void)viewDidLoad {
    [super viewDidLoad];

    _wineryArray = [NSMutableArray array];
    _foursquareWineryData = [NSDictionary dictionary];
    
    [self mapSetup];
    [self getFoursquareWineries];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBarHidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation {
    MKPinAnnotationView *ann = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    ann.canShowCallout = YES;
    ann.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return ann;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    [self setSelectedAnnotation:view.annotation];
    
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    [self performSegueWithIdentifier:@"showDetailViewFromMap" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"showDetailViewFromMap"]) {
        
        WineryDetailTVC *destinationVC = (WineryDetailTVC *)segue.destinationViewController;
        destinationVC.passedAnnotation = _selectedAnnotation;
        
    }

}

-(void)getFoursquareWineries{

    _clientSecret = @"5M4R4U4ZOBZCURJPVXBUAGKCDRGAUPN3IGT12PD54LUYQ5VM";
    _clientId = @"ICKPUV0E20DW1NOOGWGW1S0U3B2EAJEYJ2XF02VIW0CXTPTT";
    _categoryId = @"4bf58dd8d48988d14b941735";
    
    _foursquareAPI = [FoursquareAPI initWithClientSecret: _clientSecret clientID:_clientId categoryId: _categoryId];
    
    [_foursquareAPI foursquareAPI:_wineryArray handler:^(NSDictionary *data) {
        
        _foursquareWineryData = data;
        
        for (NSDictionary *wineryDict in _foursquareWineryData) {
            Winery *winery = [Winery initWithWineryName:[wineryDict valueForKey:@"name"]];
            winery.phoneNumber = [wineryDict valueForKeyPath:@"contact.formattedPhone"];
            winery.website = [wineryDict valueForKeyPath:@"url"];
            winery.longitude = [[wineryDict valueForKeyPath:@"location.lng"] doubleValue];
            winery.latitude = [[wineryDict valueForKeyPath:@"location.lat"] doubleValue];
            winery.wineryId = [wineryDict valueForKeyPath:@"id"];
            NSMutableArray *formattedAddress = [wineryDict valueForKeyPath:@"location.formattedAddress"];
            NSString *fullAddress = [NSString stringWithFormat: @"%@, %@", formattedAddress[0], formattedAddress[1]];
            winery.address = fullAddress;
            [_wineryArray addObject:winery];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_foursquareAPI createAnnotation:mapView wineryArray:_wineryArray];
        });
    }];
}

-(void)mapSetup {
    CLLocationCoordinate2D mapZoomLocation;
    mapZoomLocation.latitude = 44.954;
    mapZoomLocation.longitude = -85.615;
    _distanceSpan = 55000;
    _viewRegion = MKCoordinateRegionMakeWithDistance(mapZoomLocation, _distanceSpan, _distanceSpan);
    [mapView setRegion:_viewRegion];
}

@end
