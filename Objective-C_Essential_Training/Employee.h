//
//  Employee.h
//  Objective-C_Essential_Training
//
//  Created by Odin on 2015-09-06.
//  Copyright (c) 2015 Jon Mercer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property NSString *name;
@property int EmployeeNumber;

//returns void
// "-" is instance methods and "+" is class method
//takes no parameters
- (void) someMethod;

// Two parameters
-(int) addNum: (int) a toNum: (int) b;

@end
