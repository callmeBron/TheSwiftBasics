import Foundation
// Data Manipulation: Filter, Sort && Map
/// Previously when it came to working with data we would manually loop through the data each time i.e  for item in array { }
/// However Swift actually has convenience methods for us to use when manipulating data. ( Filter, Sorting && Mapping )

/// Definitions of most common methods...
/// Filtering: Is taking the collection of data and filter all items with a specific subset of data.
/// Sorting: Taking all items in the collection and sorting them in a specific order.
/// Mapping: Is taking the one data object and mapping it to another.

// lets dive in
/// lets begin with a data struct, say we are creating a data base for our app and we want to store a users name, their premium status and a specific order to show them in.

struct DatabaseUser {
    let name: String
    let isPremium: Bool
    let order: Int
}
/// Then lets create an array of users to use as our collection
var allUsers: [DatabaseUser] = [
    DatabaseUser(name: "Danielle", isPremium: false, order: 4),
    DatabaseUser(name: "Shannon", isPremium: false, order: 5),
    DatabaseUser(name: "Chane", isPremium: true, order: 1),
    DatabaseUser(name: "Jaedon", isPremium: false, order: 3),
    DatabaseUser(name: "Warren", isPremium: true, order: 2)
]

// Filtering: here we can create a new array to hold all our premium users.
/// initally we would tackle this by looping through our data, finding ones that match the specified criteria "i.e isPremium == true" and then create our new array.
/// This works but it is undoubtedly a long-winded way of going about this, this is where the filter method would work.

var premiumUsers: [DatabaseUser] = []

for user in allUsers {
    if user.isPremium {
        premiumUsers.append(user)
    }
}
print(premiumUsers)

/// behind the scene the .filter does exactly what weve just done prior
///  { user in ..... } is the simplified loop
var premiumUserArray: [DatabaseUser] = []

premiumUserArray = allUsers.filter { user in
    return user.isPremium ? true : false
}

/// in this, if a user returns true as the result of the condition it i will include it in the new array and if false is returned they will not be included.

print(premiumUserArray)

/// Filtering: Short hand method
/// $0 references the item we are looping on, it is exactly the same thing as user in the for loop
var premiumUserArray2: [DatabaseUser] = []

premiumUserArray2 = allUsers.filter { $0.isPremium }
print(premiumUserArray2)

// Sorting: here we can create a new array to sort by order.
var orderedUsers:[DatabaseUser] = []

/// youll notice there are now two pieces of data we have available this is because with sorting we need to define how to sort one item by another
orderedUsers = allUsers.sorted(by: { user1, user2 in
    return user1.order < user2.order
})
print(orderedUsers)

/// Sorting: Short hand method
/// To reference a second user will be $1
orderedUsers = allUsers.sorted(by: { $0.order < $1.order })

// Mapping: here we can create a new array to sort by order.
/// maybe we wanted just a list of user names from the original collection
/// so here we will transform DatabaseUser to a String

var userNames: [String] = []
userNames = allUsers.map { user in
    return user.name
}
print(userNames)

/// Sorting: Short hand method
var userNames2: [String] = []
userNames2 = allUsers.map { $0.name }
print(userNames2)

/// .map( transform: .. )
/// used to transform each element of a sequence using a provided transformation closure. It returns an array containing the results of applying the closure to each element.
let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map { $0 * $0 }
print(squaredNumbers)  // Output: [1, 4, 9, 16, 25]

/// .flatMap( transform: .. )
/// similar to 'map' but is particularly useful when you want to transform each element and also flatten the result, especially when dealing with optionals or nested arrays
let nestedNumbers = [[1, 2, 3], [4, 5], [6, 7, 8]]
let flattenedNumbers = nestedNumbers.flatMap { $0 }
print(flattenedNumbers)  // Output: [1, 2, 3, 4, 5, 6, 7, 8]

/// .compactMap( transform: .. )
/// similar to map, but it also removes nil values from the resulting array. It's particularly useful when dealing with optionals and you want to transform and filter out the nil results.
let possibleNumbers = ["1", "2", "three", "4", "five"]
let validNumbers = possibleNumbers.compactMap { Int($0) }
print(validNumbers)  // Output: [1, 2, 4]

///Mapping overview:

/// Use map when you want to transform each element in a sequence.

/// Use flatMap when you want to transform and flatten a sequence, especially if it contains nested arrays or optionals.

/// Use compactMap when you want to transform a sequence and filter out nil results, especially when working with optionals.
