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
    p1.nome = @"Comix Shop";
    p1.questList = [self iniciaQuests:1];
    [p1 adicionaEndereco:-23.556847 :-46.665169];
    p1.imagemPino = [UIImage imageNamed: @"Icon.2_81.png"];
    [[self list] addObject:p1];
    
    QTInterestPoint *p2 = [[QTInterestPoint alloc] init];
    p2.nome = @"Ludus Luderia";
    p2.questList = [self iniciaQuests:2];
    [p2 adicionaEndereco:-23.559643 :-46.646012];
    p2.imagemPino = [UIImage imageNamed: @"Icon.5_16.png"];
    [[self list] addObject:p2];
    
    QTInterestPoint *p3 = [[QTInterestPoint alloc] init];
    p3.nome = @"Geek Etc.";
    p3.questList = [self iniciaQuests:3];
    [p3 adicionaEndereco:-23.559166 :-46.660864];
    p3.imagemPino = [UIImage imageNamed: @"Icon.1_61.png"];
    [[self list] addObject:p3];
    
    QTInterestPoint *p4 = [[QTInterestPoint alloc] init];
    p4.nome = @"Sheraton Hotel";
    p4.questList = [self iniciaQuests:4];
    [p4 adicionaEndereco:-23.609225 :-46.696334];
    p4.imagemPino = [UIImage imageNamed: @"Icon.6_45.png"];
    [[self list] addObject:p4];
    
    QTInterestPoint *p5 = [[QTInterestPoint alloc] init];
    p5.nome = @"Moonshadows Bookstore";
    p5.questList = [self iniciaQuests:5];
    [p5 adicionaEndereco:-23.561501 :-46.646076];
    p5.imagemPino = [UIImage imageNamed: @"Icon.4_19.png"];
    [[self list] addObject:p5];
    
    QTInterestPoint *p6 = [[QTInterestPoint alloc] init];
    p6.nome = @"Global Quests";
    p6.questList = [self iniciaQuests:6];
    [[self list] addObject:p6];
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
            QTQuest *q2 = [[QTQuest alloc] init];
            q2.nome = @"Indie Friendly";
            q2.descricao = @"Buy a indie HQ or manga";
            q2.pontos = 200;
            [quests addObject:q2];
            QTQuest *q3 = [[QTQuest alloc] init];
            q3.nome = @"Going BR";
            q3.descricao = @"Buy a brazilian HQ (except Turma da Monica)";
            q3.pontos = 300;
            [quests addObject:q3];
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
            QTQuest *q2 = [[QTQuest alloc] init];
            q2.nome = @"Newbie Gamer";
            q2.descricao = @"Play any game";
            q2.pontos = 100;
            [quests addObject:q2];
            QTQuest *q3 = [[QTQuest alloc] init];
            q3.nome = @"Party Gamer";
            q3.descricao = @"Play a game with 4 or more people";
            q3.pontos = 200;
            [quests addObject:q3];
            QTQuest *q4 = [[QTQuest alloc] init];
            q4.nome = @"I've got Guts";
            q4.descricao = @"Play a game with people you don't know";
            q4.pontos = 300;
            [quests addObject:q4];
        }
            break;
        case 3:
        {
            QTQuest *q0 = [[QTQuest alloc] init];
            q0.nome = @"Proud Geek";
            q0.descricao = @"Go to Geek Etc.";
            q0.pontos = 100;
            [quests addObject:q0];
            QTQuest *q1 = [[QTQuest alloc] init];
            q1.nome = @"Librarian";
            q1.descricao = @"Buy a book";
            q1.pontos = 100;
            [quests addObject:q1];
            QTQuest *q2 = [[QTQuest alloc] init];
            q2.nome = @"Watchman";
            q2.descricao = @"Buy a DVD or Blu-Ray";
            q2.pontos = 100;
            [quests addObject:q2];
            QTQuest *q3 = [[QTQuest alloc] init];
            q3.nome = @"Player";
            q3.descricao = @"Buy a game";
            q3.pontos = 100;
            [quests addObject:q3];
            QTQuest *q4 = [[QTQuest alloc] init];
            q4.nome = @"National Enthusiast";
            q4.descricao = @"Buy a Brazilian book";
            q4.pontos = 300;
            [quests addObject:q4];
        }
            break;
        case 4:
        {
            QTQuest *q0 = [[QTQuest alloc] init];
            q0.nome = @"Time to Rest";
            q0.descricao = @"Go to Sheraton Hotel";
            q0.pontos = 200;
            [quests addObject:q0];
            QTQuest *q1 = [[QTQuest alloc] init];
            q1.nome = @"Star Trek King";
            q1.descricao = @"Spend a night in the  Star Trek suite";
            q1.pontos = 500;
            [quests addObject:q1];
        }
            break;
        case 5:
        {
            QTQuest *q0 = [[QTQuest alloc] init];
            q0.nome = @"Moon Visitor";
            q0.descricao = @"Go to Moonshadows";
            q0.pontos = 100;
            [quests addObject:q0];
            QTQuest *q1 = [[QTQuest alloc] init];
            q1.nome = @"Shadow Summoner";
            q1.descricao = @"Buy a booster pack of Magic: The Gathering";
            q1.pontos = 100;
            [quests addObject:q1];
            QTQuest *q2 = [[QTQuest alloc] init];
            q2.nome = @"Mage Gambler";
            q2.descricao = @"Buy a set of RPG dice";
            q2.pontos = 100;
            [quests addObject:q2];
            QTQuest *q3 = [[QTQuest alloc] init];
            q3.nome = @"Soul Gatherer";
            q3.descricao = @"Buy a miniature";
            q3.pontos = 200;
            [quests addObject:q3];
            QTQuest *q4 = [[QTQuest alloc] init];
            q4.nome = @"Illusion Summoner";
            q4.descricao = @"Buy a deck of any card game, except Magic: The Gathering";
            q4.pontos = 200;
            [quests addObject:q4];
            QTQuest *q5 = [[QTQuest alloc] init];
            q5.nome = @"Tome Collector";
            q5.descricao = @"Buy any book or HQ";
            q5.pontos = 100;
            [quests addObject:q5];
        }
            break;
        case 6:
        {
            QTQuest *q0 = [[QTQuest alloc] init];
            q0.nome = @"Among Dead";
            q0.descricao = @"Photograph any item related to zombies";
            q0.pontos = 100;
            [quests addObject:q0];
            QTQuest *q1 = [[QTQuest alloc] init];
            q1.nome = @"Ninja Apprentice";
            q1.descricao = @"Photograph any item related to  ninjas";
            q1.pontos = 100;
            [quests addObject:q1];
            QTQuest *q2 = [[QTQuest alloc] init];
            q2.nome = @"Fatal Frame";
            q2.descricao = @"Photograph any item related to ghosts";
            q2.pontos = 100;
            [quests addObject:q2];
            QTQuest *q3 = [[QTQuest alloc] init];
            q3.nome = @"The Walking Dead";
            q3.descricao = @"Participate of Zombie Walk";
            q3.pontos = 200;
            [quests addObject:q3];
            QTQuest *q4 = [[QTQuest alloc] init];
            q4.nome = @"Flango";
            q4.descricao = @"Eat a chicken pastel";
            q4.pontos = 300;
            [quests addObject:q4];
            QTQuest *q5 = [[QTQuest alloc] init];
            q5.nome = @"Brazilian Way";
            q5.descricao = @"Eat a dish of rice and beans";
            q5.pontos = 300;
            [quests addObject:q5];
        }
            break;
            
        default:
            break;
    }
    
    
    return quests;
}

+(QTInterestList *) sharedStore
{
    static QTInterestList *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}

@end
