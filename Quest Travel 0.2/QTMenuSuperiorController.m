//
//  QTMenuSuperiorController.m
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import "QTMenuSuperiorController.h"

@interface QTMenuSuperiorController ()

@end

@implementation QTMenuSuperiorController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) botoesAutoLayout
{
    [self.view removeConstraints: self.view.constraints];
    NSLayoutConstraint *botao1tamH = [NSLayoutConstraint constraintWithItem:self.botao1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao1tamW = [NSLayoutConstraint constraintWithItem:self.botao1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao1posX = [NSLayoutConstraint constraintWithItem:self.botao1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:.166 constant:0];
    
    
    NSLayoutConstraint *botao2tamH = [NSLayoutConstraint constraintWithItem:self.botao2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao2tamW = [NSLayoutConstraint constraintWithItem:self.botao2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao2posX = [NSLayoutConstraint constraintWithItem:self.botao2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:.332 constant:0];
    
    NSLayoutConstraint *botao3tamH = [NSLayoutConstraint constraintWithItem:self.botao3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao3tamW = [NSLayoutConstraint constraintWithItem:self.botao3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao3posX = [NSLayoutConstraint constraintWithItem:self.botao3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:.498 constant:0];
    
    NSLayoutConstraint *botao4tamH = [NSLayoutConstraint constraintWithItem:self.botao4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao4tamW = [NSLayoutConstraint constraintWithItem:self.botao4 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao4posX = [NSLayoutConstraint constraintWithItem:self.botao4 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:.664 constant:0];
    
    NSLayoutConstraint *botao5tamH = [NSLayoutConstraint constraintWithItem:self.botao5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao5tamW = [NSLayoutConstraint constraintWithItem:self.botao5 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.6 constant:0];
    NSLayoutConstraint *botao5posX = [NSLayoutConstraint constraintWithItem:self.botao5 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:.830 constant:0];
    [self.view addConstraints:@[botao1posX, botao1tamH, botao1tamW, botao2posX, botao2tamH, botao2tamW, botao3posX, botao3tamH, botao3tamW, botao4posX, botao4tamH, botao4tamW, botao5posX, botao5tamH, botao5tamW]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self botoesAutoLayout];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) tocouBotao: (id)sender
{
    if (sender == self.botao1) {
        [self.delegate selecionaImagemAnotacao: self.botao1.imageView.image];
    } else if (sender == self.botao2) {
        [self.delegate selecionaImagemAnotacao: self.botao2.imageView.image];
    } else if (sender == self.botao3) {
        [self.delegate selecionaImagemAnotacao: self.botao3.imageView.image];
    } else if (sender == self.botao4) {
        [self.delegate selecionaImagemAnotacao: self.botao4.imageView.image];
    } else if (sender == self.botao5) {
        [self.delegate selecionaImagemAnotacao: self.botao5.imageView.image];
    }
}

@end
