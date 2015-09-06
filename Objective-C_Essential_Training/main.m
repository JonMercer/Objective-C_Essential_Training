//
//  main.m
//  Objective-C_Essential_Training
//
//  Created by Odin on 2015-09-05.
//  Copyright (c) 2015 Jon Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>

void sampleFunction(void);

void passingObject(NSString* x);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //String literals and logging
        int num = 5;
        NSLog(@"Number is %i", num);
        
        @autoreleasepool {
            if (num == 5) {
                NSLog(@"Entered the if statement");
            }
            
            sampleFunction();
            
            
            
            NSString *myString = @"This is my string";
            passingObject(myString);
            
            
            
            
        }
    }
    return 0;
}

void sampleFunction(void) {
    for(int i = 1 ; i < 3 ; i++) {
        NSLog(@"Inside While");
    }
}

void passingObject(NSString* x) {
    NSLog(@"The string is: %@", x);
}
