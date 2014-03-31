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

MKRoute *routeDetails;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.delegate = self;
    [self procuraEndereço];
    [[self mapView] setShowsUserLocation:YES];
    [self addGestureRecogniserToMapView];
    pontoSendoAdicionado = NO;
    isRouteDraw = NO;
}

//Implementar codigo para tracar a rota

- (void) mostrarRota:(MKAnnotationView*) point
{
    MKPlacemark *placeInicio = [[MKPlacemark alloc] initWithCoordinate:self.mapView.userLocation.coordinate addressDictionary:nil];
    
    self.inicio = [[MKMapItem alloc] initWithPlacemark:placeInicio];

    MKPlacemark *placeDestino = [[MKPlacemark alloc] initWithCoordinate:[[point annotation] coordinate] addressDictionary:nil];
    
    self.destino = [[MKMapItem alloc] initWithPlacemark:placeDestino];
    
    [self obterDirecoes];
}


- (void) obterDirecoes{
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    
    request.source = self.inicio;
    request.destination = self.destino;
    request.requestsAlternateRoutes = NO;
    MKDirections *direcoes = [[MKDirections alloc] initWithRequest:request];
    
    [direcoes calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error){
        if (error) {
            NSLog(@"Error");
        } else{
            [self mostraRota:response];
        }
    }];
}

-(void) mostraRota:(MKDirectionsResponse *)response{
    for (MKRoute *rota in response.routes) {
        [[self mapView] removeOverlay:self.polyRender.overlay];
        [self.mapView addOverlay:rota.polyline level:MKOverlayLevelAboveRoads];
        isRouteDraw = YES;
    }
}






- (MKOverlayRenderer *) mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    self.polyRender = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    self.polyRender.strokeColor = [UIColor orangeColor];
    self.polyRender.lineWidth = 5.0;
    return self.polyRender;
    
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

- (void) procuraEndereço {

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
    //if (isRouteDraw) {
        MKPlacemark *placeInicio = [[MKPlacemark alloc] initWithCoordinate:self.mapView.userLocation.coordinate addressDictionary:nil];
        self.inicio = [[MKMapItem alloc] initWithPlacemark:placeInicio];
        [self obterDirecoes];
    //}
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
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
            pinView.rightCalloutAccessoryView = rightButton;
            
            pinView.calloutOffset = CGPointMake(0, 32);
        } else {
            pinView.annotation = annotation;
        }
        
        return pinView;
    }
    return nil;
}

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView rfullyRendered:(BOOL)fullyRendered {
    if (fullyRendered) {
        NSLog(@"%f", [self distanceFromUser]);
    }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        NSLog(@"Clicked");
        [self mostrarRota:view];
        isRouteDraw = YES;
    }
}


@end
