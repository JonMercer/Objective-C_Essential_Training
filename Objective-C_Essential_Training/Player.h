//
//  Player.h
//  Objective-C_Essential_Training
//
//  Created by Odin on 2015-09-06.
//  Copyright (c) 2015 Jon Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int score;

-(id) initWithInteger:(int) initialScore;

@end
