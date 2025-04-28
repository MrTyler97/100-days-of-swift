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

//Day 1 & 2 Concluded
