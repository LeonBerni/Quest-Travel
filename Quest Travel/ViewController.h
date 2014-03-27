//
//  ViewController.h
//  Quest Travel
//
//  Created by LEON SALGUEIRO VALIENGO BERNI on 26/03/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    CLLocationCoordinate2D pontoMarcador;
    BOOL pontoSendoAdicionado;
    UIImage *imagemPino;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;


/*
 View para adicionar os marcadores do usuário
 */
@property (strong, nonatomic) IBOutlet UIView *viewMarcador;
@property (strong, nonatomic) IBOutlet UIButton *vmCancelar;
@property (strong, nonatomic) IBOutlet UIButton *vmAdicionar;
@property (strong, nonatomic) IBOutlet UITextField *vmTitulo;
@property (strong, nonatomic) IBOutlet UITextField *vmSubtitulo;
@property (strong, nonatomic) IBOutlet UIButton *vmBtn1;
@property (strong, nonatomic) IBOutlet UIButton *vmBtn2;

@end
