//
//  QTInterestPoint.m
//  Quest Travel
//
//  Created by Rodrigo P. Assunção on 02/04/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import "QTInterestPoint.h"

@implementation QTInterestPoint

-(void) adicionaEndereco:(double)latitude :(double)longitude
{
    CLLocationCoordinate2D ponto;
    ponto.latitude = latitude;
    ponto.longitude = longitude;
    [self setCoordenada:ponto];
}

@end
