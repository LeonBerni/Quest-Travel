//
//  ViewController.m
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import "ViewController.h"

typedef enum PosAnimacoes {
    ADD_M_X = 250,
    SUB_M_X = -250,
    ADD_M_Y = 150,
    SUB_M_Y = -150
} PosAnimacoes;


@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    menuDireitoController = [[QTMenuDireitoController alloc] initWithNibName: @"QTMenuDireitoController" bundle: nil];
    [self.menuDireito addSubview: menuDireitoController.view];
    //[self adicionaAnimacao: ADD_M_X : @"escondeMenuDireito" : self.menuDireito];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) adicionaAnimacao: (float) animacaoDefine : (NSString *) stringValor : (UIView *) objetoAnimado
{
    [objetoAnimado setHidden: NO];
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
    animacao.duration = 1;
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

@end
