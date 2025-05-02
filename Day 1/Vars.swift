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

// Closures - Creating a function pased onto a variable

let driving = {
    print("I am driving")
}
// Calling the closure
driving()

// Accepting prarameters
let driving2 = { (place: String) in
    print("I am driving to \(place)")
}
driving2("Detroit")

//Returning values (Remeber must use pointer and var type
let driving3 = { (place: String) -> String in
    return "I am driving to \(place)"
}

let message = driving3("Detroit")

//Closures can also be used at parameters -> syntax for closure param is "closureName: ()"
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
// Calling closure as param
travel(action: driving)

//If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
travel {
    print("This is what's passed.")
}

// Returning closures
// New function that accepts a closure
func travel2(action: (String) -> String) {
    print("Im ready to go")
    var description = action("London")
    print(description)
    print("I arrived!")
}
// New closure that returns a value
travel2 { (place: String) -> String in
    return "I am driving to \(place)"
}
// Fun fact swift allows you to remove param type specification since this information was declared in function creation. The above code can be rewritten as follows:
travel2 { place in
    return "I am driving to \(place)"
}
// Closures with multiple params
func travel3(action: (String, Int) -> String) {
    print("Im getting ready to go")
    var description = action("London", 1000)
    print(description)
    print("I arrived!")
}
travel3 { (place: String, speed: Int) in
    return "I am driving to \(place) at \(speed) mph"
}

// Day 6 & 7 complete (REVIEW THIS PORTION OFTEN)

// Structs (Structures) - Can be given their own variables, functions, and constants to be used however you see fit. Simlar to classes
struct Sport {
    var name: String
}
var mysport = Sport(name: "Basketball")
print(mysport.name)
// Changing my sport
mysport.name = "Baseball"
print(mysport.name)

// Computed properties
struct Sport2 {
    // Stored properties
    var name: String
    var isOlympicSport: Bool
    // Computed property
    var olympicStatus: String {
        if isOlympicSport {
            return "Olympic Sport"
        } else {
            return "Not an Olympic Sport"
        }
    }
}
// Creating instance of my sport and grabbing the olympic status of it
var mysport2 = Sport2(name: "Basketball", isOlympicSport: true)
print(mysport2.olympicStatus)

//Property observers - runs code before or after every property change
struct Progress {
    var task: String
    var amount: Int {
        //Property Observer
        didSet {
            print("\(task) is \(amount)% complete")
        }
    }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 25
progress.amount = 50

// Adding functions
struct City {
    var population: Int
    // Nested Function only for city
    func collectTaxes() -> Int {
        return population * 500
    }
}
var london = City(population: 9_000_000)
print(london.collectTaxes())

// Mutating methods - If you want to change a property inside of a method you must use the 'mutating keyword'
struct Person {
    var name: String
    mutating func makeAnonymous() {
        name = "Clssified"
    }
}
var person = Person(name: "Vic")
print(person.name)
//Changing property with function
person.makeAnonymous()
print(person.name)

// In swift String and Array var type is also a struct. Use name of string or array followed by . to see all associated functions
var me = "Im awesome"
me.isEmpty
me.endIndex

// Initializers - similar to constructors in classes. your default if nothing is passed
struct User {
    var username: String
    // Initializer function
    init() {
        username = "Joe"
        print("Default user created")
    }
}
// Notice we don't need to specify anything when creating an instance
var user = User()
print(user.username)

// Inside methods you can use 'self' like in classes

// Lazy properties - lets you create some properties only when they are needed
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
struct Person2 {
    var name: String
    // When adding the lazy keyword the Family Tree struct is only created when directly accesed in the instance. Else it will always be created
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}
var ed = Person2(name: "Ed")
// Now the strct has been created
ed.familyTree

// Static properties - property remains (as one) across all instances. Think of addind a 'static var counter' This will be plus one with every instance and you can get this val by calling the struct name rather than the instance name.

// Access Control - lets you restrict which code can use properties and methods. just uses private keyword like in classes.
struct Person3 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}
let eddy = Person3(id: "12345")
// eddy.id wont work since id its private must use function now
print(eddy.identify())

// Day 8 & 9 completed--------------------------------------------------------------------------
