//
//  ViewController.h
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QTMenuDireitoController.h"

@interface ViewController : UIViewController {
    QTMenuDireitoController * menuDireitoController;
}

@property (weak, nonatomic) IBOutlet UIView *menuEsquerdo;
@property (weak, nonatomic) IBOutlet UIView *menuSuperior;
@property (weak, nonatomic) IBOutlet UIView *menuDireito;
@property (weak, nonatomic) IBOutlet UIView *menuInferior;

@end
