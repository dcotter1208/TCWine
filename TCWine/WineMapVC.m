//
//  WineMapVC.m
//  TCWine
//
//  Created by Donovan Cotter on 3/2/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "WineMapVC.h"
#import "WineryDetailTVC.h"
#import "WineryPhotosCVC.h"

@interface WineMapVC ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation WineMapVC

@synthesize mapView = mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    realm = [RLMRealm defaultRealm];
    [self mapSetup];
    [self getFoursquareWineries];
    [_foursquareAPI createAnnotation:mapView];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBarHidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    if ([annotation isKindOfClass:[Annotation class]]) {
        static NSString *const identifier = @"MyCustomAnnotation";
        MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView) {
            annotationView.annotation = annotation;
        } else {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        annotationView.image = [UIImage imageNamed:@"GrapeAnnotation"];
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.rightCalloutAccessoryView.tintColor = [UIColor colorWithRed:87.0f/255.0f green:60.0f/255.0f blue:131.0f/255.0f alpha:1.0f];

        return annotationView;
    }
    return nil;
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

-(void)getFoursquareWineries {

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"keyList" ofType:@"plist"];
    NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    _clientSecret = configuration[@"FoursquareAPI"][@"ClientSecret"];
    _clientId = configuration[@"FoursquareAPI"][@"ClientID"];
    _categoryId = @"4bf58dd8d48988d14b941735";
    
    _foursquareAPI = [FoursquareAPI initWithClientSecret: _clientSecret clientID:_clientId categoryId: _categoryId];
    
    [_foursquareAPI foursquareAPI:^(NSDictionary *data) {
        
        for (NSDictionary *wineryDict in data) {
            
            _winery = [Winery initWithWineryName:[wineryDict valueForKey:@"name"]];
            _winery.phoneNumber = [wineryDict valueForKeyPath:@"contact.formattedPhone"];
            _winery.website = [wineryDict valueForKeyPath:@"url"];
            _winery.longitude = [[wineryDict valueForKeyPath:@"location.lng"] doubleValue];
            _winery.latitude = [[wineryDict valueForKeyPath:@"location.lat"] doubleValue];
            _winery.wineryId = [wineryDict valueForKeyPath:@"id"];
            NSMutableArray *formattedAddress = [wineryDict valueForKeyPath:@"location.formattedAddress"];
            NSString *fullAddress = [NSString stringWithFormat: @"%@, %@", formattedAddress[0], formattedAddress[1]];
            _winery.address = fullAddress;
            
            if (![_winery.name isEqualToString:@"Traverse City Wine and Beer Tours"]) {
                [self writeToRealm:_winery];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_foursquareAPI createAnnotation:mapView];
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
    mapView.showsPointsOfInterest = FALSE;
}

-(void)writeToRealm:(Winery*)winery{
    [realm beginWriteTransaction];
    [realm addOrUpdateObject:winery];
    [realm commitWriteTransaction];
}

@end
