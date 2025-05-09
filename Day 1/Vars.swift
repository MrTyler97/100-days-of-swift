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

// Classes - Similar to structs execpt for 5 differences

//1) Classes never come with an memberwise initializer. (You must always create and initializer)
class Dog {
    var breed: String
    var name: String

    init(breed: String, name: String) {
        self.breed = breed
        self.name = name
    }
}

// 2) Classes can inherit all properties and methods from other classes. (Like java)
class Pitbull: Dog {
    // Can have its own initializer
    init(name: String) {
        //Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.
        super.init(breed: "Pitbull", name: name)
    }
}
// 3) When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other. Think of it as classes pointing to the same memory address when making copies.
class Singer {
    var name = "Gunna"
}

var singer1 = Singer()
print(singer1.name)

//Creating a copy
var singer2 = singer1
singer2.name = "Travis Scott"
// Printing the original
print(singer1.name)

// 4) Classes can have deinitializers - code that gets run when an instance of a class is destroyed.
class Human {
    var name = "John Doe"
    init() {
        print("\(name) is alive!")
    }
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    // Deinitializer
    deinit {
        print("\(name) is gone.")
    }
}
// Running loop to create and destroy each instance
for _ in 1...3 {
    let person = Human()
    person.printGreeting()
    print()
}

// 5) Mutability - If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant. However, if you have a constant class with a variable property, that property can be changed.

// Overriding - child class can overwrite inherited methods with its own method. Must use keyword override. -> override func makeNoise{}

// Final classes - Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior. -> Instead of class Dog{} its final class Dog{}

// Day 10 complete ---------------------------------------------------------------------------

// Protocols and extensions

// Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.

protocol Identifiable {
    // Requires all confoming types to have an id string that can be read or written
    var id: String { get set }
}
// We can’t create instances of that protocol - it’s a description of what we want, rather than something we can create and use directly

// Intead lets make a struct that conforms to it
struct User1: Identifiable {
    var id: String
}
// This function accepts ANY Identifiable object
func displayID(thing: Identifiable) {
    print("My ID is: \(thing.id)")
}

// Inheritiance - One protocol can inherit from another in a process known as protocol inheritance. Unlike with classes, you can inherit from multiple protocols at the same time

protocol Payable {
    func calculateWages() -> Int
}
protocol NeedsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}
// Inheriting
protocol Employee: Payable, NeedsTraining, HasVacation {

}

// Extensions - allows you to add methods to existing types.
extension Int {
    // Adding squared method
    func squared() -> Int {
        return self * self
    }
}

var mynumber = 5
print(mynumber.squared())

// Protocol Extensions - extend a whole protocol so that all conforming types get your changes.

// Swift’s arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol to add a summarize() method to print the collection neatly

extension Collection {
    func summarize() {
        print("There are \(count) elements in this collection:")
        for element in self {
            print(element)
        }
    }
}

let pythons = ["Python", "Ruby", "Swift", "JavaScript"]
pythons.summarize()

// Protocol Oriented Programming (POP) - Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol, and allows a technique called “protocol-oriented programming” – crafting your code around protocols and protocol extensions.

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}
// Every confomring type will have their own indentify method
extension Identifiable2 {
    func identify() {
        print("My ID is \(id)")
    }
}

// Remember after creating a protocol we must make a stuct in order to use it
struct Person4: Identifiable2 {
    var id: String
}
let person4 = Person4(id: "1234")
person4.identify()

// Day 11 completed --------------------------------------------------------------------------
// Protocols and extensions

// Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.

protocol Identifiable {
    // Requires all confoming types to have an id string that can be read or written
    var id: String { get set }
}
// We can’t create instances of that protocol - it’s a description of what we want, rather than something we can create and use directly

// Intead lets make a struct that conforms to it
struct User1: Identifiable {
    var id: String
}
// This function accepts ANY Identifiable object
func displayID(thing: Identifiable) {
    print("My ID is: \(thing.id)")
}

// Inheritiance - One protocol can inherit from another in a process known as protocol inheritance. Unlike with classes, you can inherit from multiple protocols at the same time

protocol Payable {
    func calculateWages() -> Int
}
protocol NeedsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}
// Inheriting
protocol Employee: Payable, NeedsTraining, HasVacation {

}

// Extensions - allows you to add methods to existing types.
extension Int {
    // Adding squared method
    func squared() -> Int {
        return self * self
    }
}

var mynumber = 5
print(mynumber.squared())

// Protocol Extensions - extend a whole protocol so that all conforming types get your changes.

// Swift’s arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol to add a summarize() method to print the collection neatly

extension Collection {
    func summarize() {
        print("There are \(count) elements in this collection:")
        for element in self {
            print(element)
        }
    }
}

let pythons = ["Python", "Ruby", "Swift", "JavaScript"]
pythons.summarize()

// Protocol Oriented Programming (POP) - Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol, and allows a technique called “protocol-oriented programming” – crafting your code around protocols and protocol extensions.

protocol Identifiable2 {
    var id: String { get set }
    func identify()
}
// Every confomring type will have their own indentify method
extension Identifiable2 {
    func identify() {
        print("My ID is \(id)")
    }
}

// Remember after creating a protocol we must make a stuct in order to use it
struct Person4: Identifiable2 {
    var id: String
}
let person4 = Person4(id: "1234")
person4.identify()

// Day 11 completed

// Optionals

// Handeling missing data - Use ? for values your unsure about
var optionalString: String? = nil

// Unwrapping - lets you look insife the optional - > use 'if let'
if let unwrappedString = optionalString {
    print(unwrappedString)
} else {
    print("optionalString is nil")
}

// Unwrappign with gaurd - guard let will unwrap an optional for you, but if it finds nil inside it expects you to exit the function, loop, or condition you used it in.

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

// Force unwrapping use '!' to force unwrapping
let str1 = "5"
// Converts string to an optional Int. This is safe because if we str was "dog" the code wont crash
let num = Int(str1)
// Forcing the str to be Int. Inly should be used if you know the value will be an integer. This can crash code if used improperly
let num2 = Int(str1)!

// Nil coalescing - unwraps an optional and returns the value inside if there is one. If there isn’t a value – if the optional was nil – then a default value is used instead
func name(id: Int) -> String? {
    if id == 1 {
        return "Gunna"
    } else {
        return nil
    }
}
// ?? Allows for the nil return to be Anon
let name5 = name(id: 15) ?? "Anon"

// Optional chaining - a.b?.c -> Swift will check whether b has a value, and if it’s nil the rest of the line will be ignored – Swift will return nil immediately. But if it has a value, it will be unwrapped and execution will continue
let names6 = ["John", "Paul", "Blake", nil]
names6[2]?.uppercased()
names6[3]?.uppercased()

// Failable initializers - an initializer that might work or might not

struct Car {
    var id: String
    // Optional initializer
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
// Type casting - used to check the type of an instance or to treat that instance as a different superclass or subclass type using the is, as?, and as! operators. It’s commonly used when working with polymorphism

// Main class
class Animal {
}
// Inheriting classes
class Fish: Animal {
}

class Cat: Animal {
    func MakeNoise() {
        print("Meow! Meow!")
    }
}

let pets = [Fish(), Cat(), Fish(), Fish(), Cat()]
// Check type of instance (type casting)
for pet in pets {
    // if let unwraps pet. as? checks if the currrent pet instance is of type Cat
    if let cat = pet as? Cat {
        cat.MakeNoise()
    }
}

// Day 12 completed

// Review: Functions, Optionals, Enumerations, Structs, Classes

// Create a favorite album function
func favoriteAlbum(name: String) {
    print("My favorite album is \(name)")
}
print(favoriteAlbum(name: "Wunna"))

func cubed(_ number: Int) -> Int {
    return number * number * number
}
var myNum = 10
print("\(myNum) cubed is \(cubed(myNum))")

// Optionals -  using nil

func areYouHating(weather: String) -> String? {
    if weather == "Sunny" {
        return nil
    } else {
        return "Yes i am"
    }
}

// Make sure to hadle nil
var status = areYouHating(weather: "Sunny")

func haterAction(status: String) {
    if status == "Yes i am" {
        print("Hating")
    }
}
// Unwrapping the function
if let haterStatus = areYouHating(weather: "Rainy") {
    // If function has String type
    haterAction(status: haterStatus)
} else {
    // Has nil type
    print("Not hating")
}

// Optional Chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Future"
    case 2008: return "Lil Wayne"
    default: return nil
    }
}

// Optional chaining is the ?.uppercased()
let album = albumReleased(year: 2006)?.uppercased()
print("\(album)")

//Enumerations - define your own value | Can add values to enums - > Classical(founded: Int)
enum Genre {
    case Rock, Jazz, HipHop, Classical
}

func getLoveStatus(genre: Genre) -> String? {
    if genre == .HipHop {
        return "I love it"
    } else {
        return nil
    }
}
print("\(getLoveStatus(genre: Genre.Rock))")
