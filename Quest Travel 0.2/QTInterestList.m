//
//  QTInterestList.m
//  Quest Travel
//
//  Created by Rodrigo P. Assunção on 03/04/14.
//  Copyright (c) 2014 LEON SALGUEIRO VALIENGO BERNI. All rights reserved.
//

#import "QTInterestList.h"

@implementation QTInterestList

-(id)init
{
    self = [super init];
    if (self) {
        [self iniciaLista];
    }
    return self;
}

-(void)iniciaLista
{
    [self setList:[[NSMutableArray alloc] init]];
    
    QTInterestPoint *p1 = [[QTInterestPoint alloc] init];
    p1.nome = @"Comix";
    p1.questList = [self iniciaQuests:1];
    [[self list] addObject:p1];
    
    QTInterestPoint *p2 = [[QTInterestPoint alloc] init];
    p2.nome = @"Ludus";
    p2.questList = [self iniciaQuests:2];
    [[self list] addObject:p2];
}

- (NSMutableArray*)iniciaQuests:(int)lugar
{
    NSMutableArray *quests = [[NSMutableArray alloc] init];
    
    switch (lugar) {
        case 1:
        {
            QTQuest *q0 = [[QTQuest alloc] init];
            q0.nome = @"Comix Guest";
            q0.descricao = @"Go to Comix";
            q0.pontos = 100;
            [quests addObject:q0];
            QTQuest *q1 = [[QTQuest alloc] init];
            q1.nome = @"HQ Fan";
            q1.descricao = @"Buy any HQ or manga";
            q1.pontos = 100;
            [quests addObject:q1];
        }
            break;
        case 2:
        {
            QTQuest *q0 = [[QTQuest alloc] init];
            q0.nome = @"Questing Adventurer";
            q0.descricao = @"Go to Ludus";
            q0.pontos = 100;
            [quests addObject:q0];
            QTQuest *q1 = [[QTQuest alloc] init];
            q1.nome = @"Tavern Addicted";
            q1.descricao = @"Buy any drink";
            q1.pontos = 100;
            [quests addObject:q1];
        }
            break;
            
        default:
            break;
    }
    
    return quests;
}

@end
