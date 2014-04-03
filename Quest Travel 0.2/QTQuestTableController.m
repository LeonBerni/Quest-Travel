//
//  QTQuestTableController.m
//  Quest Travel
//
//  Created by Rodrigo P. Assunção on 02/04/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import "QTQuestTableController.h"

@implementation QTQuestTableController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self selectedPoint]) {
        return [[[self selectedPoint] questList] count];
    }
    
    return [[[[self interestPoints] objectAtIndex:section] questList] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QTCell *cell = [[QTCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSString *nome;
    
    if ([self selectedPoint]) {
        cell.quest = [[[self selectedPoint] questList] objectAtIndex:indexPath.row];
        nome = [[[[self selectedPoint] questList] objectAtIndex:indexPath.row] nome];
    }
    else
    {
        cell.quest = [[[[self interestPoints] objectAtIndex:indexPath.section] questList] objectAtIndex:indexPath.row];
        nome = [[[[[self interestPoints] objectAtIndex:indexPath.section] questList] objectAtIndex:indexPath.row] nome];
    }
    
    [[cell textLabel] setText:nome];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *title = [[UILabel alloc] init];
    
    if ([self selectedPoint]) {
        title.text = [[self selectedPoint] nome];
    }
    else
    {
        title.text = [[[self interestPoints] objectAtIndex:section] nome];
    }
    
    return title;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self selectedPoint]) {
        return 1;
    }
    
    return [[self interestPoints] count];
}

-(id)initWithPresets
{
    self = [super init];
    if (self) {
        QTInterestList *l = [QTInterestList sharedStore];
        [self setInterestPoints: [l list]];
    }
    return self;
}

@end
