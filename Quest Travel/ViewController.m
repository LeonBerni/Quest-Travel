//
//  ViewController.m
//  Quest Travel
//
//  Created by LEON SALGUEIRO VALIENGO BERNI on 26/03/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
    [self procuraEndereço];
    [[self mapView] setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mapControl:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}


- (void) procuraEndereço {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocationCoordinate2D centro;
    centro.latitude = locationUsuario.location.coordinate.latitude;
    centro.longitude = locationUsuario.location.coordinate.longitude;
    CLLocationDistance distancia = [self distanceFromUser];
    CLCircularRegion *regiaoDeBusca = [[CLCircularRegion alloc] initWithCenter: centro radius: distancia identifier:@"regiaoDeBusca"];
    [geocoder geocodeAddressString: @"Alameda Santos 1325" inRegion:regiaoDeBusca completionHandler:^(NSArray *placemarks, NSError *error)  {
        for (CLPlacemark* aPlacemark in placemarks) {
            CLLocationCoordinate2D coordinate;
            MKPointAnnotation *anotacao = [[MKPointAnnotation alloc] init];
            coordinate.latitude = [[NSString stringWithFormat:@"%f",aPlacemark.location.coordinate.latitude] doubleValue];
            coordinate.longitude = [[NSString stringWithFormat:@"%f",aPlacemark.location.coordinate.longitude] doubleValue];
            anotacao.coordinate = coordinate;
            
            
            
            anotacao.title = aPlacemark.country;
            
            [[self mapView] addAnnotation: anotacao];
        }
    }];
}


- (double)distanceFromUser
{
    double zoomer = MKMetersBetweenMapPoints(MKMapPointForCoordinate(self.mapView.userLocation.location.coordinate), self.mapView.visibleMapRect.origin);
    
    if (zoomer > 50000) {
        zoomer = 50000;
    }
    
    return zoomer;
}


- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    locationUsuario = userLocation;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered {
    if (fullyRendered) {
        NSLog(@"%f", [self distanceFromUser]);
    }
}
@end
