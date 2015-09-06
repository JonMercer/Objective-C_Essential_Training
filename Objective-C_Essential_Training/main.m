//
//  main.m
//  Objective-C_Essential_Training
//
//  Created by Odin on 2015-09-05.
//  Copyright (c) 2015 Jon Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Player *firstPlayer = [[Player alloc] init];
        NSLog(@"Score is %i",[firstPlayer score]);
        
        Player *secondPlayer = [[Player alloc] initWithInteger:999];
        NSLog(@"Score is %i",[secondPlayer score]);

    }
    return 0;
}
