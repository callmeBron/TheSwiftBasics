import Swift

/// Basic types: Strings, Booleans, Int etc..
/// Tuples: How to combine a multitude of data, to one singular piece of data
/// Custom types: Have a bunch of data types inside (structs, classes or enums)

/// But what if we wanted a collection of a type i.e ( a collection of strings)
/// In code we have what is known as an array, which works similar to a list.

/// This will cover how we create arrays and how to work with them.
/// && looking at Sets, sets are unique as in they wont have multiple of the same items, where an array might have a duplication of the same item.
/// Sets are however uncommon.

// Arrays
/// an array is a collection of data types and are defined by using [] brackets around any type such as [String]
/// Arrays fall in as items which are in the stack, which means when we edit an array we will be mutating the array, copying it and replacing it

/// with coding there are a few ways we go about working with data

/// here we have two pieces of data, which we could call within an app, however these are separate pieces of data and cant be called in a combined way...
var myTitle1: String = "title 1"
var myTitle2: String = "title 2"

/// yes we could achieve this  by creating a tuple and combing the data that way
/// in essence this could work, but it lacks the scalabilty, what if we wanted to have a few hundred items?
func createTuple(value: (title1: String, title2: String)) { }
createTuple(value: (title1: myTitle1, title2: myTitle2))

/// We could also create a struct which holds data, but this also falls into an issue with scalability
struct TitlesModel {
    let title1: String
    let title2: String
}

func createValues(value: TitlesModel) {}
createValues(value: TitlesModel(title1: myTitle1, title2: myTitle2) )

/// This is where Arrays shine and come into play, lets see how we use them!
let orange = "Orange"
let apple = "Apple"

/// lets create a collection or array of fruits, they work as an ordered list, so orange would be our first item and apple our second.

let fruits: [String] = [orange,apple]

func createFruitShop(items: [String]) { }
createFruitShop(items: fruits)

// How are arrays defined?

/// Usually you encapsulate the type with [] brackets, more common approach.
var array1: [Int] = []
/// Alternitively you could declare Array with a generic type :  Array<String>. (technical way)
var array2: Array<Int> = []

// Manipulating Arrays
/// once we have an array there a a few awesome things we can do with it!

var carArray: [String] = ["Audi", "Mercedes", "BMW", "Toyota", "Ashton Martin"]

/// we can grab the count
let amountOfCars = carArray.count

/// we can get the first item or last item
let firstCar = carArray.first
let lastCar = carArray.last

// what if we wanted to add to the array ?
/// we could go about it like this:
/// This is uncommon as arrays have their own methods  to add items
carArray = carArray + ["Volkswagen"]
carArray.count

///Append method: this will add an item to the end of the array
/// append(newElement) will add a singular item
carArray.append("Jeep")
print(carArray)

/// append(contentsOf: sequence) will add an array of items
var expensiveCars = ["Porsche","Tesla","Bently"]
carArray.append(contentsOf: expensiveCars)
print(carArray)

//Accessing items in the array with subscripts
/// Besides using first or last there are no other methods for us to grab the second or hundredth item
/// we can do this by using subscripts, where we can specify which index of the array we want to specify.

/// Indexes work like such: If we have a collection, their indexes would start at 0 ... etc
/// Counts start at 1.. etc

/// This is illustrated below

let firstIndex = carArray.indices.first
let lastIndex = carArray.indices.last
let count = carArray.count

///accessing items
///lets say we wanted to return the BMW, in the list it is currently at position 2.
carArray[2]

///subscripts are not safe, lets say we wanted to access a number out of the range such as 10 in this case, we would crash our app because there is no items found at the 10th postition.
///error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x18bce2e10). The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.

// carArray[10]

/// we should only be accessing the value at the index if we are absolutely sure there is a value
/// a way to check this is like so:

if carArray.indices.contains(10) {
    /// executable code...
} else {
    print(carArray)
}

/// Adding items inbetween items
/// Arrays have methods to insert items at specific positions

var groceryList: [String] = ["soap", "washcloth"]

groceryList.insert("milk", at: 1)
print(groceryList)

/// similarly we can also insert a multitude of items
let newItems = ["bread", "eggs"]
groceryList.insert(contentsOf: newItems, at: 2)
print(groceryList)

// removing items
groceryList.remove(at: 4)
print(groceryList)

groceryList.removeAll()

/// we arent limited to using basic types when creating an array, we could make a custom type and make that an array as well
struct ProductModel {
    let title: String
    let price: Int
}

///arrays are limitless and arent limited by duplication of objects within
var myProducts: [ProductModel] = [
    ProductModel(title:"P1", price: 10),
    ProductModel(title:"P2", price: 55),
    ProductModel(title:"P3", price: 78),
    ProductModel(title:"P4", price: 10),
    ProductModel(title:"P5", price: 30),
    ProductModel(title:"P6", price: 25),
    ProductModel(title:"P7", price: 1)
]

// Sets Vs Arrays
/// we can have duplicaiton of items within an array, where as items in a set are unique and you can see this illustrated below, the set will remove the duplicate value of "apple"
/// sets are unordered, where as arrays have an order

var finalFruits = ["apple","apple", "banana", "orange"]
print(finalFruits)

var fruitSet: Set<String> = ["apple","apple", "banana", "orange"]
print(fruitSet)
