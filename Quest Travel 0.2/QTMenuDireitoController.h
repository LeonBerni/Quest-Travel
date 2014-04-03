//
//  QTMenuDireitoController.h
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QTQuestTableController.h"

@interface QTMenuDireitoController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property QTQuestTableController *qtController;

@end
