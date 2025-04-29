// Import for UIKit is needed in Xcode playgrounds
// import UIKit

var greeting = "Hello, playground"

var age = 18

//Underscores are thousand seperators
var population = 8_000_000_000

// Strict types can mix differnt data types like python
// declare new var for different data type.

//Multi-line stirngs
var multiLineString = """
    This has
    Multiple lines
    """
// getting rid of \n -> \
var newLineString = """
    Heyy boo \
    how are u?
    """

// Put varible in string -> \()
var name = "John"
var str = "Hello my name is \(name)"

// let are constants like in Javascript. Can't change it later
let name1 = "John"

// Typ annotation declares type (swift declare automatically but cool to know this
let age1: Int = 18
let name2: String = "Vic"

//Arrays
let numbers = [1, 2, 3, 4, 5]

numbers[2]  // 3

//Sets - Arent stored in any order and no dups
let colors = Set(["red", "green", "blue"])
let colors2: Set<String> = ["red", "green", "blue", "red"]

// Tuples -
let point: (Int, Int) = (1, 2)

var name3 = (first: "John", last: "Doe")
name3.first
name3.1

// Dictionaries - name = key
var height = ["Victor": 1.78, "John": 1.80]
// Defaults
height["Victor"]
height["Jake"]
height["Jake", default: 0]  // ***

// Empty collection
var emptyArray: [Int] = []

var emptySet: Set<Int> = []
var words = Set<String>()

var emptyDictionary: [String: Int] = [:]
var teams = [String: String]()
teams["Rangers"] = "Toronto"
emptyDictionary["Rangers"] = 1

// Enumeration
enum Result {
    case success(grade: Int)
    case failure(grade: String)
}

let res = Result.success(grade: 90)
let res2 = Result.failure(grade: "F")

// More Enum
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
    case jupiter
}

var earth = Planet(rawValue: 2)
earth = Planet.earth

//Day 1 & 2 Concluded --------------------------------------------------------------------------

// Arithmetic operators
// Typical in java / python

// Calculations
// + = / - * %

// Overloading - concatinating
let fake = "Hey"
let fake2 = fake + " boo"
let array = [1, 2, 3]
let array2 = [4, 5, 6]
let array3 = array + array2

// Compound assignment
// Typical in java / python
// += -=

// Comparison
// > < >= <= == !=

// Conditions
let firstcard = 11
let secondcard = 12

if firstcard > secondcard {
    print("First card is higher")
} else {
    print("Second card is higher")
}
// Condition combining
// && ||

// Ternery
let thirdcard = 13

print(thirdcard > secondcard ? "First card is higher" : "Second card is higher")

// Switch case same as java or python

//Ranges must use ...
let range = 1...5
for i in 1...10 {
    print(i)
}

var times = 0
while true {
    print("Hello World")
    times += 1
    if times == 5 {
        break
    }
}
// break out certain nested loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
// Skip iteration uses continue obviously

//Functions
func sayHi() {
    print("Hello World")
}
sayHi()
// using '-> (var type)' in function creation expects an retrun statement
func saySomething(message: String) -> String {
    let addingToMessage = " Im doing well."
    return message + addingToMessage
}
//must add argument name -> message
print(saySomething(message: "How are you"))

// Unique parameters things to be conciouse of
func sayHello(to name: String) -> String {
    return "Hello, \(name)!"
}
// to name -> Externally its called 'to' internally its called 'name' i.e (to name: )
print(sayHello(to: "Alice"))

// can use _ to omit external naming
func sayHello2(_ name: String) -> String {
    return "Hello, \(name)!"
}
print(sayHello2("Bob"))

// Default params are status quo to change simply call with param name externally and set it

// Variadic functions -> paramter can be a rnage of numbers that gets turned into an array within a function
func sumOfNumbers(_ numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
sumOfNumbers(1, 2, 3, 4, 5)

// Throws and errors via function
// Create an enum
enum PasswordError: Error {
    case obvious
}
// Create function
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
// To run throws it must be wrapped in try catch statements in swift. Each try must be in a do bracket

do {
    try checkPassword("password")
    print("Password is valid")
} catch {
    print("Password is invalid")
}
// inout allows you to change parameters inside the function that is reflected outdside the function. Must use & in function call when using inout
func increment(_ number: inout Int) {
    number += 1
}
var x = 10
increment(&x)
print(x)

// Day 3 - 5 completed --------------------------------------------------------------------------
