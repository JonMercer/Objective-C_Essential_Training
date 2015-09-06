//
//  main.m
//  Objective-C_Essential_Training
//
//  Created by Odin on 2015-09-05.
//  Copyright (c) 2015 Jon Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Employee *fred = [[Employee alloc] init];
        
        [fred someMethod];
        
        //This setter is automatically generated
        //Not sure if getter is set automatically too
        [fred setName:@"Fred Smith"];
        

    }
    return 0;
}
