//
//  QTQuestTableController.h
//  Quest Travel
//
//  Created by Rodrigo P. Assunção on 02/04/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QTInterestList.h"
#import "QTInterestPoint.h"
#import "QTQuest.h"
#import "QTCell.h"

@interface QTQuestTableController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *interestPoints;
@property QTInterestPoint *selectedPoint;

-(id) initWithPresets;

@end
