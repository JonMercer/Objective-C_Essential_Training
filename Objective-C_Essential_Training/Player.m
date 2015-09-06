//
//  Player.m
//  Objective-C_Essential_Training
//
//  Created by Odin on 2015-09-06.
//  Copyright (c) 2015 Jon Mercer. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id) init
{
    self = [self initWithInteger:5000];
    return self;
}

-(id)initWithInteger:(int)initialScore
{
    self = [super init];
    if (self) {
        //custom
        _score = initialScore;
    }
    return self;
}

@end
