//: [Previous](@previous)

// Rundown of Tuple object

/// all of the functions we have so far created have only returned us one piece of data but what if in our app we wanted to return multiple pieces of data?
/// in swift we use something known as a tuple it is one object which holds multiple types of data..
/// in functions we arent limited to only returning one piece

var userName: String = "name"
var userIsPremium: Bool = false
var userIsNew: Bool = true

func getUserName() -> String {
  userName
}

func getPremiumStatus() -> Bool {
   userIsPremium
}
/// limited to one return type
func getUserInfo() -> String {
 let name = getUserName()
 let isPremium = getPremiumStatus()
   
 return name
}

/// to return both values we will look towards a tuple for help
/// to declare the values as one return we wrap the types  in parenthesis ' () '

func getUserInfo2() -> (String,Bool) {
 let name = getUserName()
 let isPremium = getPremiumStatus()
   
 return (name, isPremium)
}

/// now if we wanted to return only one value say string as we did before we are met with an error
/// "Cannot convert return expression of type 'String' to return type '(String, Bool)'"
/// tuples combine multiple pieces of data..

/// we arent limited to tuples in functions we can use this in variables

var userData1: String = userName
var userData2: (String ,Bool, Bool) = (userName,userIsPremium,userIsNew)

let info1 = getUserInfo2()

/// now how do we actually use values from within this tuple? such as if we only wanted the name, well this is how we use indexes which are chronological in order in this example 0 and 1. 0 is the first item in the tuple
let name: String = info1.0
/// typing this can be confusing, how are we meant to know what 0 or 1 may represent or when it has many values
/// we can actually give it parameter names as such

func getUserInfo3() -> (name: String, premiumStatus: Bool) {
 let name = getUserName()
 let isPremium = getPremiumStatus()
   
 return (name, isPremium)
}

/// this allows us to mitagte confusion of the indexes
let info2 = getUserInfo3()
let name2 = info2.name
let premiumStatus = info2.premiumStatus

/// it allows us to group mulitple pieces of data together



//: [Next](@next)

