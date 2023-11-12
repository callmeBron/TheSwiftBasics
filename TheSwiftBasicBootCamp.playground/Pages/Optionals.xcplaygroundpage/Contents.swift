//: [Previous](@previous)

import UIKit

//in swift we have optionals and at their core they are a piece of data which may or may not have a value..

/// previously we looked at swift data types such as strings and booleans, while here we are going to look into optional strings and optional booleans

/// a simple example is looking at a boolean, it has a simple value of true or false an optional boolean will have the value of true, false or nil - nil being no value, so when something is optional it means it might have a value or there might not be a value...

/// the reality of code is yes, you might think you have data but at runtime you might actually not have that data available, we use optionals incase we dont have the data... in the example is when you app is loading the data so it does eventually get the data but might not have it immediately

/// here we will take a dive into what optionals are, how to write/declare them and then how to safely unwrap them.

/// unwrapping means having an optional and making them non optional. unsafely or incorrectly unwrapping them may leave your app crashing

/// nil values are basically when objects may have a value or may not have anything at all... Int will always have a whole number based value like 7 or 13 whereas an optional Int or (Int?) may have nothing as a result set.

/// option clicking on my Bool will show you the declaration will look something along the lines of " let myBool: Bool " indicating that this object has the value of Bool which can either be true or false

let myBool: Bool = false

/// to declare an optional value we declare the type follow with the ? after as seen below, option clicking now will show you that this value has an optional type and can contain the value of true, false or nil
/// below denotes that we dont know if there is a value associated with the object but if there happens to be a value it will be of type boolean

var newBool: Bool? = nil

/// in swift we usually use optionals, because often times we are working with data and we arent always sure that the data will be available and ready when we need it.. so in our code we need to learn how to check if there is value

print(newBool)
newBool = true
print(newBool)
newBool = false
print(newBool)
newBool = nil
print(newBool)

/// Expression implicitly coerced from 'Bool?' to 'Any' - this error means we are printing out an optional bool

/// how to deal with these warnings

// nil coalescing operator ( ?? )
/// we can firstly provide it with a default value using "?? value" after the object this value is provided if the compiler at runtime does not find a value for the object it will then default to using this value instead

/// lets look at this example, below we created a new object which has the same value type of the newBool we previously declared and this is all good and well, but what if i had a regular Bool and wanted to set its value to newBool?

let newValue: Bool? = newBool

/// the compiler will give us a warning as we cant set an optional value to a non optional value, this will result in this error
/// "Value of optional type 'Bool?' must be unwrapped to a value of type 'Bool'"

 let firstNonOptBool: Bool = newBool

/// this error message will give us two ways of handling or unwrapping this bool firstly using 'coalesce we learned about previously where we provide it with a default value  or by force unwrapping it which will nearly always result in a crash and would be extremely poor to use

let secondNonOptBool: Bool = newBool ?? false

/// how the compiler reads this is as follows: " The value of 'secondNonOptBool' is 'newBool' (if there is one), otherwise use the default of false

/// we can test this through a quick example

/// if we po 'secondNonOptBool' value while newBool has a set value of nil we can see it returns us the result of false or its default, if we then change newBool to true we can see that  'secondNonOptBool' takes on that value and now returns the value true and that in essence is how we use the nil coalescing operator

// the benefit of setting a optional to its non optional, is that we wont have to go through the work of checking each time if it does indeed have a value...

/// optionals are not type specific and can be any data type

var myString: String? = "hello world!"

print(myString ?? "there is no value found")

myString = "new text"

print(myString ?? "there is no value found")

myString = nil

print(myString ?? "there is no value found")

// ----------------------------------------------------

//Lets deep dive into a more complex use case
/// say we have a check if user is premium

var userIsPremium: Bool? = nil

func checkIfUserIsPremium() -> Bool? {
   return userIsPremium
}

/// if all youre doing is returning a value in the function youre able to omitt the word return as long as its the only thing you are returning..

/// the problem with this function is that it returns us a value which is optional and setting it to a new value will only carry that along

var isPremium = checkIfUserIsPremium()

/// alternatively we would want to return an actual boolean
func checkIfUserIsPremium2() -> Bool {
   return userIsPremium ?? false
}

var isPremium2 = checkIfUserIsPremium2()

// if-let unwrapping
/// using an if-let statement to retrieve the value from the var, if we can get the value from ' userIsPremium ' then lets use that value

func checkIfUserIsPremium3() -> Bool {
    /// if there is a value in userIsPremium then we set that value to a new constant to be used within the scope of the closure
    if let newValue = userIsPremium {
        /// here we have access to the non optional value
        print(newValue)
        return newValue
    } else {
       /// if there isnt a value then lets come down here
        return false
    }
}
/// if-let say if there is a value then let the new value equal that value and are another way of safely unwrapping it

// guard statements

func checkIfUserIsPremium4() -> Bool {
    guard let newValue = userIsPremium else { return false }
    
    return newValue
}
/// the difference between if-let and guard-let is guard lets makes sure there is a value , if there is a value let new value equal that value, else return out of the function, the failure will enter the closure whereas with the if-let the success enters the closure

/// So, use if let if you just want to unwrap some optionals, but prefer guard let if you’re specifically checking that conditions are correct before continuing.

// Safely unwrapping optionals comes down to either using a nil coalescing, an if-let or a guard statement

/// to really dive into the power of these statements

/// complex if-let

var userIsNew: Bool? = true
var userDidCompleteOnboarding: Bool? = false
var userFavouriteMovie: String? = nil
/// so lets pretend in our app maybe we have a function to get user status, which needs to know whether the user is new or the user has completed onboarding or what the users favourite move is
/// we cant just pass our original values to this function luckily we learnt 3 ways of dealing with optionals

/// notice we can chain if-lets like such
/// ' if let newValue1 = value1, let newValue2 = value2 { ...} '

func checkIfUserISSetUp() -> Bool {
    /// now we are saying if all 3 have a value then we enter the closure,  so if we go into the closure factually we know that we have a value for each one
    if let isNew = userIsNew, let onboardingStatus = userDidCompleteOnboarding, let favouriteMovie = userFavouriteMovie {
        return getUserStatus(userStatus: isNew,
                             onboardingStatus: onboardingStatus,
                             favouriteMovie: favouriteMovie)
    } else {
        /// this catches if any of the values do equal nil
        return false
    }
    
   
}

func getUserStatus(userStatus: Bool,
                   onboardingStatus: Bool,
                   favouriteMovie: String ) -> Bool {
    if userStatus && onboardingStatus {
        return true
    }
    
    return false
    
}

// guard status
func checkIfUserISSetUp2() -> Bool {

    guard let isNew = userIsNew, let onboardingStatus = userDidCompleteOnboarding, let favouriteMovie = userFavouriteMovie  else {
        /// this catches if any of the values do equal nil
        return false
   
    }
    
    return getUserStatus(userStatus: isNew,
                         onboardingStatus: onboardingStatus,
                         favouriteMovie: favouriteMovie)
}
//--------------------------------------------------
// when will a guard let be better than an if let?


func checkIfUserISSetUp3() -> Bool {
    /// this will be a layered if-let, now this works but can become confusing really quickly
    if let isNew = userIsNew {
        /// isNew == Bool
        /// if this has a value regardless of the others
        /// but maybe within this block of code we want to check if onboarding has been completed
        
        if let onboardingStatus = userDidCompleteOnboarding {
            /// onboardingStatus == Bool
            /// now we have access to isNew and onboardingStatus since this is a child of the original if let
            
            if let favouriteMovie = userFavouriteMovie {
                /// favouriteMovie == Bool
                /// and since here we have access to all the values we can return
                
                return getUserStatus(userStatus: isNew,
                                     onboardingStatus: onboardingStatus,
                                     favouriteMovie: favouriteMovie)
                
            } else {
                /// favouriteMovie == nil
                return false
            }
        } else {
            /// onboardingStatus == nil
            return false
        }
    } else {
      /// isNew == nil
        return false
    }
}

// a simpler way of doing this is with guard statements, because you dont have to go into the closures.

func checkIfUserISSetUp4() -> Bool {
    guard let isNew = userIsNew else { return false }
    guard let onboardingStatus = userDidCompleteOnboarding else { return false }
    guard let favouriteMovie = userFavouriteMovie else { return false }
    
    return getUserStatus(userStatus: isNew,
                         onboardingStatus: onboardingStatus,
                         favouriteMovie: favouriteMovie)
  
        
}

// optional chaining

func getUsername() -> String? {
    return "test"
}

func getTitle() -> String {
    return "title"
}

func getUserData() {
    let userName: String? = getUsername()
    /// i will get the count if username is not nil
    let count = userName?.count
    
    let title: String = getTitle()
    /// i will always get the count
    let titleCount = title.count
    
    /// while this may be a singular optional you can chain these together, if user name is not nil and the first character is not nil then we get the lowercase.

    let firstChatacterIsLowerCased = userName?.first?.isLowercase
}
/// youll notice the ? after username, this denotes to the user that the value of username is indeed optional and we will only get the count if it does indeeed have a value, because if username is nil we wont be able to execute the count function
/// the benefit here is that we dont have to unwrap the value




//: [Next](@next)
