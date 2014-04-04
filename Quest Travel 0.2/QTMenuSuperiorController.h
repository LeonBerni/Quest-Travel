//
//  QTMenuSuperiorController.h
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QTMenuSuperiorControllerDelegate <NSObject>
- (void) selecionaImagemAnotacao : (UIImage *) imagem;
@end

@interface QTMenuSuperiorController : UIViewController

@property (nonatomic, weak) id <QTMenuSuperiorControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *botao1;
@property (weak, nonatomic) IBOutlet UIButton *botao2;
@property (weak, nonatomic) IBOutlet UIButton *botao3;
@property (weak, nonatomic) IBOutlet UIButton *botao4;
@property (weak, nonatomic) IBOutlet UIButton *botao5;


- (IBAction) tocouBotao: (id)sender;


@end
