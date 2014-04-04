//
//  QTInterestPoint.h
//  Quest Travel
//
//  Created by Rodrigo P. Assunção on 02/04/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "QTQuest.h"

@interface QTInterestPoint : NSObject

@property NSString *nome;
@property NSMutableArray *questList;
@property CLLocationCoordinate2D coordenada;
@property UIImage *imagemPino;

-(void) adicionaEndereco:(double)latitude :(double)longitude;

@end
