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
    pontoSendoAdicionado = NO;
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



//Adicionar alert view para o titulo e subtitulo / overlay
- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    if (pontoSendoAdicionado == YES)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    pontoMarcador =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    pontoSendoAdicionado = YES;
    
    [self viewMarcador].hidden = NO;
}

- (IBAction)viewMarcadorAdd:(id)sender {
    MKPointAnnotation *pin = [[MKPointAnnotation alloc]init];
    
    pin.coordinate = pontoMarcador;
    pin.subtitle = [self vmSubtitulo].text;
    pin.title = [self vmTitulo].text;
    
    [self.mapView addAnnotation:pin];
    
    pontoSendoAdicionado = NO;
    [self limparViewMarcador];
}

- (IBAction)viewMarcadorCancel:(id)sender {
    [self limparViewMarcador];
}

- (void) limparViewMarcador
{
    [self vmTitulo].text = @"";
    [self vmSubtitulo].text = @"";
    [self viewMarcador].hidden = YES;
}

- (IBAction)imageSelect:(id)sender {
    
    switch ([sender tag]) {
        case 11:
            imagemPino = 1;
            break;
        case 12:
            imagemPino = 2;
            break;
            
        default:
            imagemPino = 0;
            break;
    }
}



- (void) iniciaComPontos {
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    [geocoder geocodeAddressString: @"Alameda Santos" completionHandler:^(NSArray *placemarks, NSError *error) {
//        for (CLPlacemark* aPlacemark in placemarks) {
//            CLLocationCoordinate2D coordinate;
//            MKPointAnnotation *anotacao = [[MKPointAnnotation alloc] init];
//            coordinate.latitude = [[NSString stringWithFormat:@"%f",aPlacemark.location.coordinate.latitude] doubleValue];
//            coordinate.longitude = [[NSString stringWithFormat:@"%f",aPlacemark.location.coordinate.longitude] doubleValue];
//            anotacao.coordinate = coordinate;
//            anotacao.title = @"teste";
//            
//            [[self mapView] addAnnotation: anotacao];
//        }
//    }];
}


- (void)viewWillAppear:(BOOL)animated {
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            //pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            
            //IMAGEM
            switch (imagemPino) {
                case 1:
                    pinView.image = [UIImage imageNamed:@"verdanian_goblin.png"];
                    break;
                case 2:
                    pinView.image = [UIImage imageNamed:@"images.jpg"];
                    break;
                    
                default:
                    break;
            }
            
            
            pinView.calloutOffset = CGPointMake(0, 32);
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

@end
