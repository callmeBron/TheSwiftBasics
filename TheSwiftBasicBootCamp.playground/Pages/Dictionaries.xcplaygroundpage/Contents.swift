import Foundation

// Dictionaries 📚
/// They are another collection type, and are a way for us to group data together
/// They do work differently than arrays and have different use cases
/// Dictionaries are based on keys and not indexes like arrays

/// Think about it like such ....  💭:
/// if you were to open a dictionary and look for a word you would go to the specific word (Key) and read the definition (Value)

/// Dictionaries are incredibly fast, they are one of the fastest ways to access data within software engineering, so its extremely important to get a grip on how they work.
/// They are most definitely less common than arrays, This is because data is stored in an orderly fashion inside arrays, so if we are wanting to display that data specifically on the screen then we want to go with Arrays which is most of the time.
/// As infered this means dictionaries are unordered groups of data.
/// Dictionaries are safer than arrays because we can crash the app if data isnt found at a specific index where that isnt possible with dictionaries.

/// Lets look at some code...

/// Dictionaries are closer to sets in the fact that they are not ordered, they also have keys and those keys cannot be duplicated, they however can have keys with the same values.

// How to declare dictionaries
/// They are declared similarly to arrays using [] however they need two types, the first type specifies the key and the second its associated value type.
var myFirstDictionary: [String:Bool]

/// in this example the key is apple and the value is true
myFirstDictionary = [
    "Apple" : true,
    "Orange" : false
]

// Accessing an item in a Dictionary
/// with arrays we used indexes to get specific values i.e. myArray[1] , with dictinaries we would instead of using an index we would put in a key  myDictionary[key]
let item = myFirstDictionary["Apple"]

/// when we access items with an index they returned as non optional, which if we accessed something at a bad or non existent index it would result in a crash, with dictionaries the values are returned as optional, making it safe to access.
/// if we try to access a key which isnt in our dictionary we would have a  nil value returned

let anotherDictionary: [Int: String] = [
    0:"Apple",
    417: "Banana"
]

let item2 = anotherDictionary[0]
let item3 = anotherDictionary[12]

// Adding, removing, merging && updating items
/// There are different approaches we use to add to an existing Dictionary
/// Creating a new key with a value
anotherDictionary[13] = "Tsweezy"
print(anotherDictionary)

/// Removing items: Targets the key
anotherDictionary.removeValue(forKey: 412 )

/// Merging an item
var userInfo: [String: Any] = [
   "firstName": "Alex",
   "school": "St. Primary School",
   "score": 8.8,
   "age": 16]
print("Original User Info: \(userInfo)")

/// creating a new dictionary with other info
let otherInfo: [String: Any] = ["country": "USA",
   "lastName": "Murphy",
   "fatherName": "Martin Murphy",
   "pincode": 6783456]
userInfo = userInfo.merging(otherInfo, uniquingKeysWith: { current, _ in
   return current
})
print("Updated User Info: \(userInfo)")


/// updating an item
userInfo.updateValue("USA", forKey: "country")
userInfo.updateValue("Murphy", forKey: "lastName")
userInfo.updateValue("Martin Murphy", forKey: "fatherName")
print("Updated User Info: \(userInfo)")


// When to use an array over a dictionary
/// Most of the time arrays are most common because most of they time when we are working with data and we want to display them on screen we want the data to be in a specific order.
/// i.e if you wanted to display a list of resturants in an order on the screen
/// however accessing items in a dictionary is very fast, one of the fastest things in computer programing, so if we had large sets of data with a unique id, then we use a dictionary as we dont have to check if there is an item at an index because they are safe and would just return us nil

/// If you want to store a list of all words in a dictionary for a game, that has no duplicates and the order doesn’t matter so you would go for a set.
/// If you want to store all the articles read by a user, you would use a set if the order didn’t matter (if all you cared about was whether they had read it or not), or use an array if the order did matter.
/// If you want to store a list of high scores for a video game, that has an order that matters and might contain duplicates (if two players get the same score), so you’d use an array.
/// If you want to store items for a todo list, that works best when the order is predictable so you should use an array.
/// If you want to hold precisely two strings, or precisely two strings and an integer, or precisely three Booleans, or similar, you should use a tuple.

/// another example to view differences between the array and dictionary: Imagine we had a model for posts on a social media platform
struct PostModel {
    let id: String
    let title: String
    let likeCount: Int
}
/// then we create an array for post model

var postArray: [PostModel] = [
    PostModel(id:"ab",
              title:"Taylor Swift",
              likeCount:13),
    PostModel(id:"cd",
              title:"kim",
              likeCount:5),
    PostModel(id:"ef",
              title:"Tswizzle",
              likeCount:13000)
]

if postArray.indicies.contains(1) {
    let item = postArray[1]
    print(item)
}

/// or a dictionary
var postDict: [String:PostModel] = [
    "aa": PostModel(id:"ab",
              title:"Taylor Swift",
              likeCount:13),
    "bb": PostModel(id:"cd",
              title:"kim",
              likeCount:5),
    "cc": PostModel(id:"ef",
              title:"Tswizzle",
              likeCount:13000)
]

let item2 = postDict["aa"]
print(item2)
