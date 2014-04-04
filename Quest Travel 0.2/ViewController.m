//
//  ViewController.m
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self iniciaMapa];
    [self iniciaMenus];
    [self iniciaGestures];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}

//***//

//Inicializações
- (void) iniciaMapa {
    self.mapView.delegate = self;
    [[self mapView] setShowsUserLocation:YES];
}

- (void) iniciaMenus {
    self.arrayImagensPontosPredef = [[NSMutableArray alloc] init];
    [self addPontos];
    
    menuSuperiorController = [[QTMenuSuperiorController alloc] initWithNibName: @"QTMenuSuperiorController" bundle: nil];
    [self.menuSuperior addSubview: menuSuperiorController.view];
    [self criaAutoLayout:self.menuSuperior :menuSuperiorController.view];
    menuSuperiorController.delegate = self;
    
    menuDireitoController = [[QTMenuDireitoController alloc] initWithNibName: @"QTMenuDireitoController" bundle: nil];
    [self.menuDireito addSubview: menuDireitoController.view];
    [self criaAutoLayout:self.menuDireito :menuDireitoController.view];
}

- (void) iniciaGestures {
    addPinGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(comecaAdicarPonto:)];
    addPinGesture.minimumPressDuration = 0.5;
    [self.mapView addGestureRecognizer:addPinGesture];
}

//***//

//Cria autolayout para os menus
- (void) criaAutoLayout : (UIView *) parentView : (UIView *) childView {
    [childView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(childView);
    
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:nil views:views]];
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:nil views:views]];
}

//***//

//Relacionados com Animação
- (void) adicionaAnimacao: (float) animacaoDefine : (NSString *) stringValor : (UIView *) objetoAnimado {
    if ([stringValor rangeOfString:@"mostra"].location != NSNotFound) {
        [objetoAnimado setHidden: NO];
    }
    [objetoAnimado setUserInteractionEnabled: NO];
    CABasicAnimation *animacao;
    NSString *animationKeyPath;
    
    if (objetoAnimado == self.menuDireito || objetoAnimado == self.menuEsquerdo) {
        animationKeyPath = @"transform.translation.x";
    } else {
        animationKeyPath = @"transform.translation.y";
    }
    
    animacao = [CABasicAnimation animationWithKeyPath: animationKeyPath];
    
    if ([stringValor rangeOfString:@"mostra"].location != NSNotFound) {
        animacao.fromValue = [NSNumber numberWithFloat: animacaoDefine*-1];
    }
    
    animacao.byValue = [NSNumber numberWithFloat: animacaoDefine];
    animacao.duration = 0.34;
    animacao.delegate = self;
    animacao.removedOnCompletion = NO;
    animacao.fillMode = kCAFillModeForwards;
    
    [animacao setValue: stringValor forKey: @"anim"];
    
    [objetoAnimado.layer addAnimation: animacao forKey: stringValor];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([[anim valueForKey:@"anim"]  isEqual: @"escondeMenuSuperior"]) {
        [self.menuSuperior setUserInteractionEnabled: NO];
        [self.menuSuperior setHidden: YES];
        [self.menuSuperior.layer setFrame: self.menuSuperior.frame];
    } else if ([[anim valueForKey:@"anim"]  isEqual: @"mostraMenuSuperior"]) {
        [self.menuSuperior setUserInteractionEnabled: YES];
    }
    
    if ([[anim valueForKey:@"anim"]  isEqual: @"escondeMenuDireito"]) {
        [self.menuDireito setUserInteractionEnabled: NO];
        [self.menuDireito setHidden: YES];
        [self.menuDireito.layer setFrame: self.menuDireito.frame];
    } else if ([[anim valueForKey:@"anim"]  isEqual: @"mostraMenuDireito"]) {
        [self.menuDireito setUserInteractionEnabled: YES];
    }
    
    if ([[anim valueForKey:@"anim"]  isEqual: @"escondeMenuInferior"]) {
        [self.menuInferior setUserInteractionEnabled: NO];
        [self.menuInferior setHidden: YES];
        [self.menuInferior.layer setFrame: self.menuInferior.frame];
    } else if ([[anim valueForKey:@"anim"]  isEqual: @"mostraMenuInferior"]) {
        [self.menuInferior setUserInteractionEnabled: YES];
    }
    
    if ([[anim valueForKey:@"anim"]  isEqual: @"escondeMenuEsquerdo"]) {
        [self.menuEsquerdo setUserInteractionEnabled: NO];
        [self.menuEsquerdo setHidden: YES];
        [self.menuEsquerdo.layer setFrame: self.menuEsquerdo.frame];
    } else if ([[anim valueForKey:@"anim"]  isEqual: @"mostraMenuEsquerdo"]) {
        [self.menuEsquerdo setUserInteractionEnabled: YES];
    }
}

- (void) animaSaida {
    [self adicionaAnimacao: SUB_M_Y : @"escondeMenuSuperior" : self.menuSuperior];
    pontoSendoAdicionado = NO;
    [self adicionaAnimacao: ADD_M_X : @"escondeMenuDireito" : self.menuDireito];
    [self adicionaAnimacao: ADD_M_Y : @"escondeMenuInferior" : self.menuInferior];
    [self adicionaAnimacao: SUB_M_X : @"escondeMenuEsquerdo" : self.menuEsquerdo];
    self.botaoMenuDireito.hidden = NO;
}
//***//

//Relacionados com o mapa
- (IBAction) mapMode : (UISegmentedControl *)sender {
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

- (IBAction) tapMap : (id)sender {
    [self animaSaida];
    [self becomeFirstResponder];
}

//***//

//Relacionados com rotas
- (void) construirRota: (MKAnnotationView*) point{
    MKPlacemark *placeInicio = [[MKPlacemark alloc] initWithCoordinate:self.mapView.userLocation.coordinate addressDictionary:nil];
    
    self.inicio = [[MKMapItem alloc] initWithPlacemark:placeInicio];
    
    MKPlacemark *placeDestino = [[MKPlacemark alloc] initWithCoordinate:[[point annotation] coordinate] addressDictionary:nil];
    
    self.destino = [[MKMapItem alloc] initWithPlacemark:placeDestino];
    
    [self obterDirecoes];
}

- (void) obterDirecoes {
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    
    request.source = self.inicio;
    request.destination = self.destino;
    request.requestsAlternateRoutes = NO;
    MKDirections *direcoes = [[MKDirections alloc] initWithRequest:request];
    
    [direcoes calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error){
        if (error) {
            NSLog(@"Error: %@", error.description);
        } else{
            [self mostraRota:response];
        }
    }];
}

- (void) mostraRota:(MKDirectionsResponse *)response{
    for (MKRoute *rota in response.routes) {
        [[self mapView] removeOverlay:self.polyRender.overlay];
        [self.mapView addOverlay:rota.polyline level:MKOverlayLevelAboveRoads];
        rotaSendoPrintada = YES;
    }
}

- (MKOverlayRenderer *) mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    self.polyRender = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    self.polyRender.strokeColor = [UIColor orangeColor];
    self.polyRender.lineWidth = 5.0;
    return self.polyRender;
}

//***//

//Relacionado com pointAnnotations
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    id <MKAnnotation> anotacao = [view annotation];
    if ([anotacao isKindOfClass:[MKPointAnnotation class]])
    {
        [self construirRota: view];
        rotaSendoPrintada = YES;
    }
}

- (void) comecaAdicarPonto : (UIGestureRecognizer *) sender {
    if (sender.state != UIGestureRecognizerStateBegan)
        return;
    if (pontoSendoAdicionado == YES)
        return;
    
    CGPoint touchPoint = [sender locationInView:self.mapView];
    self.pontoMarcador = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    if (!pontoSendoAdicionado) {
        pontoSendoAdicionado = YES;
        [self adicionaAnimacao: ADD_M_Y : @"mostraMenuSuperior" : self.menuSuperior];
    }
}

- (void) selecionaImagemAnotacao : (UIImage *) imagem {
    CGSize tamanhoIcone = CGSizeMake(TAMANHO_ICONE, TAMANHO_ICONE);
    UIGraphicsBeginImageContextWithOptions(tamanhoIcone, NO, 0.0);
    [imagem drawInRect:CGRectMake(0, 0, tamanhoIcone.width, tamanhoIcone.height)];
    UIImage *imagemCompacta = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imagemSelecionada = imagemCompacta;
    
    UIAlertView *selecionaTitulo = [[UIAlertView alloc] init];
    selecionaTitulo.delegate = self;
    selecionaTitulo.title = @"Give your annotation a Title!";
    selecionaTitulo.alertViewStyle = UIAlertViewStylePlainTextInput;
    [selecionaTitulo addButtonWithTitle:@"Cancel"];
    [selecionaTitulo addButtonWithTitle:@"Done!"];
    [selecionaTitulo show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Done!"])
    {
        UITextField * campoTexto = [alertView textFieldAtIndex:0];
        [self adicionaMarcador: campoTexto.text];
    }
}

- (void) adicionaMarcador: (NSString *) titulo {
    MKPointAnnotation *pin = [[MKPointAnnotation alloc]init];
    
    pin.coordinate = self.pontoMarcador;
    pin.title = titulo;
    
    [self.mapView addAnnotation:pin];
    
    [self adicionaAnimacao:SUB_M_Y : @"escondeMenuSuperior" : self.menuSuperior];
    pontoSendoAdicionado = NO;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
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
            pinView.canShowCallout = YES;
            
            //IMAGEM
            if (self.arrayImagensPontosPredef.count != 0) {
                pinView.image = [self.arrayImagensPontosPredef objectAtIndex:0];
                [self.arrayImagensPontosPredef removeObjectAtIndex: 0];
            } else {
                pinView.image = self.imagemSelecionada;
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

//***//

//Relacionado com a lista de quests
- (IBAction) mostraListaQuests:(id)sender {
    if (pontoSendoAdicionado) {
        return;
    }
    [self adicionaAnimacao: SUB_M_X : @"mostraMenuDireito" : self.menuDireito];
    pontoSendoAdicionado = YES;
    self.botaoMenuDireito.hidden = YES;
}


- (void) addPontos
{
    QTInterestList *lista = [QTInterestList sharedStore];
    
    for (QTInterestPoint *i in [lista list]) {
        if (![i isEqual: [lista.list objectAtIndex: lista.list.count-1]]) {
            MKPointAnnotation *ponto = [[MKPointAnnotation alloc] init];
            ponto.coordinate = i.coordenada;
            ponto.title = i.nome;
            
            CGSize tamanhoIcone = CGSizeMake(TAMANHO_ICONE, TAMANHO_ICONE);
            UIGraphicsBeginImageContextWithOptions(tamanhoIcone, NO, 0.0);
            [i.imagemPino drawInRect:CGRectMake(0, 0, tamanhoIcone.width, tamanhoIcone.height)];
            UIImage *imagemCompacta = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            [self.arrayImagensPontosPredef addObject: imagemCompacta];
            
            [[self mapView] addAnnotation:ponto];
        }
    }
}

//Relacionados com os menus laterais
@end
