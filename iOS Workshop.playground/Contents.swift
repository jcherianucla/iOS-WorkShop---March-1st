import Foundation //Like the standard library
import UIKit    //Important library for UI stuff for iOS
/*:
# INTRO TO SWIFT
## Variables, Constants, Data Types in Swift

Note that Swift is a type inferenced language, so you
may never have to explicitly define what a variable or constant
type is! The system can infer the type by itself. If however you
wish to specify the type add _: after the variable name._

Variables in swift are declared using the keyword *var*
and Constants are declared using *let* keyword.

The basic data types in swift are just like that of any other language,
except we always declare the type with capital letters.
* Int - Signed Integer can only be integers
* Double - Double precision floating point can hold decimal points
* Bool - Boolean value for true or false
* Character - Single ASCII Character (generally called char in C++)
* String - A set of Characters put together to form words,
sentences etc (string)
* Float - Single precision floating point
* UInt - Unsigned Integer

More exist but the top five are probably the most important to note!

*/
var x = 5 //Declares an Int of value 5
var y:Int = 5 //Similar to the line above but with explicit declaration

let prof = "David Smallberg" //Constant! Name cannot be changed from Smallberg

//: Just like in any language we can also do basic arithmetic on numeric
//: data types and cast different data types as follows:

x += y //The shorthand +=, -=, *=, /=, %= all work on the same variable
let radius = Double(x) //Cast Int to Double
let pi = 3.61
let area = pi * pow(radius, 2.0) //pow is imported from Foundation

let trueStatement = "CS is great when taught by " + prof//String concatenation

//: To print out to standard output (like cout in C++ or printf in C or println in Java)

print(trueStatement)

/*:
The newest type that Swift offers however is the optional type. This essentially
creates a value of any other type (like an Int or String) and gives it the option
to be a value of that type or return nil (basically similar to returning a nullptr
if the value does not exist. The *?* operator after the type makes it *optional*.

When you declare an optional type, you have to *unwrap* it using *!* to get the
actual value.
*/

var doIExist:Bool? //Declare an optional Bool
doIExist = true //Set it to an actual value
doIExist! //Safely unwrap to get the return value

/*:

## Control Flow

### If Statements

Just as in any other language, Swift allows for control flow using the *if* and *else*
statements! The *if* statement will take in an expression (if not already a Bool) and
evaluate its Bool equivalent. If the code is true, it will run whats in the _if block_
else it will run whats in the _else block_ where the block is defined by curly braces.

We can also use _else if_ statements to provide multiple conditions!

Swift also allows for use of *switch* statements when dealing with data that is
finitely enumerable (like Int or Character)

Swift also supports the ternary operator (expression) ? (stuff to do if true) : (stuff to do if false)

*/

if prof.containsString("Smallberg")
{
    print("I should start teaching CS in Swift!")
}
else
{
    print("Swift is the greatest language out there")
}

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

/*:
The most important feature of Swift is the _if let_ statement. When dealing with optionals
we can't be sure that the value truly exists. So we have to first check if the value is 
not nil (like checking for a nullptr) and then safely unwrap - OTHERWISE YOU'RE GOING TO 
GET A BAD ACCESS ERROR LIKE WITH A NULLPTR IN C++!

Instead of typing it out like that however, _if let_ allows us to assign the unwrapped
variable to a temporary constant if that value is not nil and then using it in our code!

*/

var name:String?
var luckyNumber = 10 //Change this number from 10 to another number to test out what happens

if(luckyNumber == 10)
{
    name = "Charlie"
}
else
{
    print("I want to go to the Chocolate Factory!")
}

if let luckyBoy = name //luckyBoy becomes the unwrapped version of name
{
    print(luckyBoy + " is going on a sweet adventure")
}

/*:
### Collection Types and Looping

Just like in most languages, Swift contains Collection types. These collections are limited
to *arrays* - ordered sets of objects Dynamic like vector/list/ArrayList/LinkedList etc.;
*dictionaries* - key value pairs like a hashtable/HashMap/Map etc; *set* -
unordered list of objects.

Looping works in the same way with _for loops_, _while loops_, _repeat-while loops_ (like
do while loops in C++) a they do in other languages. The difference is mainly with
_for loops_. You can now have _for in loops_ which can take the value of what exists
in the collection you're looping through!

*/

var groceryList: Array = ["Milk", "Eggs", "Cheese", "Bananas", "Bananas", "Bananas"]
var classes: Dictionary = ["CS" : "Computer Science", "EE" : "Electrical Engineering", "MAE" : "Mechanical and Aerospace Engineering", "CSE" : "Computer Science and Engineering", "MATH" : "Mathematics"]
var oddSet: Set = [1,3,5,7,9,11]
var evenSet: Set = [0,2,4,6,8,10]

for item in groceryList
{
    if(item.containsString("Banana"))
    {
        print("You must go to UCLA!")
    }
    else
    {
       print("You have a boring list")
    }
}

oddSet.union(evenSet).sort() //Unifies the two sets and sorts them!

for (classCode, className) in classes
{
    print("\(classCode) means \(className)") //Allows us to embed String variables into new Strings!
}

for (var i = 0; i < groceryList.count; i++)
{
    groceryList.removeAtIndex(i) //Delete item at current index
    i--;    //Decrement to stay at the same point
}
print(groceryList)

repeat
{
    groceryList.append("Computers") //Do at least once
}while(groceryList.count < 4) //Continue until condition is no longer true

//: The power of Control must never be underestimated! With looping, collection types
//: and logical statements, we can program almost any algorithm!

/*:
## Tuples and functions

Now that we already know about the basic types, its worth noting that *Swift* allows
users to create a value with multiple data points. This is called a *tuple* and 
though my explanation may not be the best, the examples below will show you how intuitive
they are!

Next up on the agenda is functions! A core feature to any language, functions reduce
repeated code and allow for greater *functionality*. Functions can take arguments 
referred to as parameters, do things with them and then return a value, or they can
just be void like in C/C++! The key difference in Swift is that if you want to
declare a function you start it with the keyword _func_ and if you want to return
something you use the *->* operator. A typical function that takes an argument may have
the following layout:

func doSomething(nameOfParamOne: typeOfParamOne, nameOfParamTwo: typeOfParamTwo) -> returnType
{
    return something
}
*/
var myCartesianPoint = (x: 5, y: 10)
print(myCartesianPoint.x)
print(myCartesianPoint.y)

//:As you can imagine, because tuples are just like normal types you can even use them as return values for functions!

func doSomethingFun(classes: [String:String], classNum: Int) -> (name: String, classCodes: String)
{
    var code = String()
    var prof = "Unkown"
    for (classcode, classname) in classes
    {
        if(classname.containsString("Computer"))
        {
            code = classcode + "\(classNum)"
            switch(classNum)
            {
            case 31:
                prof = "Smallberg"
                break
            case 32:
                prof = "Nachenberg"
                break
            default:
                prof = "Eggert"
                break
            }
        }
        else
        {
            code = classcode + "\(classNum)"
        }
    }
    return (prof, code)
}

//: Normal functions one is used as in the case above are known as global functions in swift, but we can also have nested functions -
//: functions local inside another function as follows:

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}

/*:

## Closures

In swift closures are essentially functions with an argument as a function that you can define and implement within the function itself.
The way these will work, is that they will run the _closure_ within the function! They are for general purposes declared as follows:
{ (parameters) -> return type in
statements
}

Closures are a lot more powerful in Swift and they are generally used as _completion handlers_ such that when the function finishes,
you return the final state of the things in the function - especially useful when the tasks you deal with are _asynchronous_. Nothing
else will execute until the closures *finishes*

Useful links for closures: https://www.weheartswift.com/closures/
https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html

*/

var animals = ["Lion", "Cheetah", "Whale", "Bison", "Cow", "Zebra","Tiger"]
var sorted = animals.sort({ (s1: String, s2: String) -> Bool in
    return s1 < s2
})

/*:

## Classes

As in an Object oriented programming language, swift has the ability of creating classes with multiple inheritance. This essentially means
that you can create your own types and define the properties of your type with its own variables and functions.

The Swift compiler makes a default constructor for you, but you can define your own or override an existing classes and every constructor
is known as _init_. A constructor is essentially what you use to create the object.

*/

class Human
{
    var firstName: String?
    var lastName: String?
    var age:Int?
    var occupation:String?
    var favoriteFood:[String]?
    
    init()
    {
        self.firstName = "Unknown"
        self.lastName = "Unknown"
        self.age = 0
        self.occupation = nil
        self.favoriteFood = nil
    }
    
    init(fn: String, ln: String, age: Int, job: String, food: String)
    {
        self.firstName = fn
        self.lastName = ln
        self.age = age
        self.occupation = job
        self.favoriteFood = [String]()
        self.favoriteFood!.append(food)
    }
    
    func getAJob(job: String)
    {
        self.occupation = job
    }
    
    func birthday()
    {
        self.age!++
        print("PARTAYY!")
    }
    
    func addFood(food: String)
    {
        self.favoriteFood!.append(food)
    }
    
    func giveDescription()
    {
        print("My name is \(self.firstName!) \(self.lastName!). I am \(self.age!) years old. I work as a \(self.occupation) and my favoritest food is \(self.favoriteFood?.first)")
    }
}

var person = Human(fn: "Jahan", ln: "Cherian", age: 20, job: "Student", food: "Apple")
person.giveDescription()

/*:

# Further Reading

Ofcourse everything given above is just the very basics of Swift, and there is a lot more to the language. However with a solid understanding
of the concepts above, you should be able to start programming with iOS!

Useful Links:
* https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309/
* http://www.raywenderlich.com/category/swift/
* http://www.tutorialspoint.com/swift/index.html/

*/

