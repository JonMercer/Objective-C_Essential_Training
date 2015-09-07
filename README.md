# Objective-C_Essential_Training

These are my notes from the course. I cared about the big-picture view so I may google things in the future as I develop. These notes are not guaranteed to be accurate. I'm tackling this project from the eyes of a java developer.

# Frameworks
- OC the language is small
  - Frameworks are like libraries
  - `foundation` is like the util class

# Why Objective C (history)
smalltalk which is OO merged with C to create objective-c. Apple used this language to base their software from.

- Uniquely objective-c
  - `@...` the @ symbol
  - `NS...` next step
  - `[...]` calling methods

# Structure
- has import
- has main method
- `reutrn 0` is a good thing

# Compiling
- "build" compiles code and places a runnable file in the FS somewhere. Can launch this file through terminal

# Loop
- `continue;`  goes back to top of loop
- `break;` breaks out of loop

# Function
- definitions have to be in a certain order
  - can write a stub at the beginning to get around this

# Data Types
- **Primitives** int, float, double, char, BOOL
- **Complex** NSString, NSDate, ...
- :question: where does `short` belong?

##Long
- `long long int foo = ...`
  - 32 and 64 bit systems treat this as long
- `long int foo =`
  - 32 bit and 64 bit systems treat this differently

##Float
- 4 bytes
- `foo = 5.4f;`
- %f, %e (scientific notation), %g (guess)

##Double
- 8 bytes (double the float)
- `foo = 5.4;`
- %f, %e (scientific notation), %g (guess)

##BOOL
- Written `YES NO true false`
- %i

# Variables
- pass by value

```objective-c
int foo = 10;
timesTwo(foo);
NSLog(foo);
//prints out 10
```

- :bangbang: try to avoid global variables

# Enum
- similar to the one in java

# Strings
- Strings are objects, all objects have pointers
- `NSString *message = @"Hello";`

#Object Orientation
- class (type) ----> object (instance)

##Pointers
- **ALL OBJECTS ARE ACCESSED USING POINTERS**
  - `*message` holds a memory address which are always 4 bytes
- Use `*foo` when defining a new variable or passing it around
- `%@`

##Method
- a function inside another class
- calling a method
  - `[myObject someMethod]` a void method
  - `[myObject insertString: @"Hello" anotherString: @"World"]` two parameters

## Class Methods
- like static methods in java
- `[NSDate date];`
  - this has a `+` in the docs

## Instance Method
- `[message uppercase];`
- has a `-` in the class definition

# Memory Management
- few years ago ARC (automatic ref count) was invented
  - kept track of number of pointers to an object in memory.
    - If number == 0, then remove
      - Which is why we don't have to call `[foo release]` anymore
- **"Dangling Pointer"**: released from memory but still called
- **"Memory Leak"**: object not released from memory, even when nothing points to it
- Releasing `id` is determinable unlike garbage collector
  - think of `[foo release]` being addded to a line of code when we think it makes sense

# Object Creation

```objective-c
NSDate *myDate;
myDate = [NSDate new];
```
  - this is the new way of creating new object, but it's not that popular yet

```objective-c
NSDate *myDate;
//allocates spot in memory
myDate = [NSDate alloc];
//assings the address to variable
myDate = [myDate init];
```

- here's an even shorter version of the above
```objective-c
NSDate *myDate = [[NSDate alloc] init];
```

# Autorelease Objects

```objective-c
@autoreleasepool {
  //old way of generating
  NSDate * myDate = [[NSDate alloc] init];

  //new way. Requires @autorelease
  NSDate * otherDate = [NSDate date];
}
```

#Creating Class
- `@interface` --> .h
  - stores `@properties`
- `@implementation` --> .m
  - has NSObject as parent
- `import "MyHeader.h"` meant for package class
- `import <MyHeader.h>` meant for external library

#Adding Methods
- `+` is class method. Cannot access instance variables
- parameters
  - `(int) timesTen: (int) num;`
  - `(NSString * ) createMessage: (NSString *) input;`
    - accepts and returns object type
  - `(int) addNumber: (int) a toNumber: (int) b;`
    - two parameters and returns and int

#Properties
- `@property` generates setters and getters
  - in the past, we had to do `@synthesize` to grab property values. Not anymore
  - the getter is just the name of variable
  - :question: I think `_foo` grabs the instance variable
- Property
  - `@property (strong) NSString *firstName;`
    - Default value in ARC
  - `@property (weak) NSString *firstName;`
    - Object deleted when all strong ties are gone
  - `@property (readonly) NSString *firstName;`
    - only getters
  - `@property (nonatomic) NSString *firstName;`
    - thread safety
- Class variables (the private ones). Placed in .m file

```objective-c
@implementation Player
{
  int privateValue;
}
//....
@end
```

#Initializers
- in `.m` file, init already defined in `.h` by default
  - kind of like custom constructors

```objective-c
@implementation Player
-(id) init
{
  self = [super init];
  if(self) {
    _ score
  }
  return self
}
@end
```
- Custom inits have to be declared in .h file

#Dealloc
- Destroys objects
  - we don't usually have to write this
    - only when we shut down a server or a file stream
  - Historically, it's to release objects your object created
- You can create your own dealloc method, but it's not called

#Collections

##Arrays
- No bound checking
- size declared
- Cant mix types

##NSArrays
- `NSArray *newArray = @[...]`
- Cannot add things once created
  - can use `NSMutableArray` if you want to change things
    - add adds one to end. Remove deletes one and moves indexes

## Dictionary
- Like a map
- shortcut: `@{ key:object, key2:object2}`

## Foreach (aka forin)
- faster under the hood
- looks like java

#Saving a file
- `NSKeyedArchiver` (encoding)
- `NSkeyedUnarchiver` (decoding)
- saves a plist
- class to encode/decode must follow the `<NSCoding>` protocol (added in .h file)
  - implement `encodeWithCoder`
  - implement `initWithCoder`

#Description
- like toString() in java

#Inheritance
- `NSObject` has alloc and init
  - objective-c doesn't use inheritance as much as other OO languages

#Categories
- Adds a method to a super class without needing to sub-class it
- `@interface ClassToExtend (MyCategoryName)`
- remember to import header file
- **can only add methods not properties**

#Class Extensions
- Like categories, except we add properties
  - must own the source code though
- Can write private methods this way, but should be done in .m file instead of .h

```objective-c
@interface foo ()
@property //...
@end
```

#Protocol
- standardization between objects
  - similar to interface in java
- only a list of methods
  - to conform to protocol, use `<Foo>`

```objective-c
@protocol Cleaner
@required
  - (void) cleanFloors;

@optional
  - (void) cleanWindows;

@end
```

#Dynamic Typing
- :question: kind of like generics in java?
- `id`
  - the generic pointer
- `for ( id currentObject in bunchOfObjects)`

#Exceptions
- treated much more seriously than in java
  - used to exit the app gracefully
