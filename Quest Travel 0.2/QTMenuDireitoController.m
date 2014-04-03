//
//  QTMenuDireitoController.m
//  Quest Travel 0.2
//
//  Created by Leo Gigliotti on 4/3/14.
//  Copyright (c) 2014 Leo Gigliotti. All rights reserved.
//

#import "QTMenuDireitoController.h"

@interface QTMenuDireitoController ()

@end

@implementation QTMenuDireitoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.qtController = [[QTQuestTableController alloc] initWithPresets];
    [self.tableView setDelegate:self.qtController];
    [self.tableView setDataSource:self.qtController];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
