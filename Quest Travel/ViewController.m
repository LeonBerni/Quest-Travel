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
    [self iniciaComPontos];
    [[self mapView] setShowsUserLocation:YES];
    [self addGestureRecogniserToMapView];
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

- (void)addGestureRecogniserToMapView{
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(addPinToMap:)];
    lpgr.minimumPressDuration = 0.5; //
    [self.mapView addGestureRecognizer:lpgr];
    
}




- (void) iniciaComPontos {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString: @"Alameda Santos" completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark* aPlacemark in placemarks) {
            CLLocationCoordinate2D coordinate;
            MKPointAnnotation *anotacao = [[MKPointAnnotation alloc] init];
            coordinate.latitude = [[NSString stringWithFormat:@"%f",aPlacemark.location.coordinate.latitude] doubleValue];
            coordinate.longitude = [[NSString stringWithFormat:@"%f",aPlacemark.location.coordinate.longitude] doubleValue];
            anotacao.coordinate = coordinate;
            anotacao.title = @"teste";
            
            [[self mapView] addAnnotation: anotacao];
        }
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}


@end
