//
//  ViewController.h
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "QTInterestList.h"
#import "QTAllDefines.h"
#import "QTMenuDireitoController.h"
#import "QTMenuSuperiorController.h"

@interface ViewController : UIViewController <MKMapViewDelegate, QTMenuSuperiorControllerDelegate, UIAlertViewDelegate> {
    //Controladores dos menus
    QTMenuSuperiorController *menuSuperiorController;
    QTMenuDireitoController *menuDireitoController;
    
    //Gestures do mapa
    UILongPressGestureRecognizer *addPinGesture;
    
    //Condicionais
    BOOL pontoSendoAdicionado;
    BOOL rotaSendoPrintada;
}

//Views iniciais
@property (weak, nonatomic) IBOutlet UIView *menuEsquerdo;
@property (weak, nonatomic) IBOutlet UIView *menuSuperior;
@property (weak, nonatomic) IBOutlet UIView *menuDireito;
@property (weak, nonatomic) IBOutlet UIView *menuInferior;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *botaoMenuDireito;

//Propriedades de rota
@property (strong, nonatomic) MKMapItem *inicio;
@property (strong, nonatomic) MKMapItem *destino;
@property (strong, nonatomic) MKPolylineRenderer *polyRender;
@property (strong, nonatomic) MKOverlayPathView *polyOverlayRender;

//Propriedades de pointAnnotations
@property (strong, nonatomic) IBOutlet UIView *viewMarcador;
@property (nonatomic) CLLocationCoordinate2D pontoMarcador;
@property (strong, nonatomic) UIImage *imagemSelecionada;
@property (strong, nonatomic) NSMutableArray *arrayImagensPontosPredef;

@end
