import UIKit
// previously we were learning all the coding basics and writing them essentially in one file, but moving on to acutal apps ..
// when building apps you dont want to have all your code in a singular file, instead you want to have them in multiple files which encompass functions that we can call within the app

// what happens behind the scenes you have one function that will execute a block of code and then you might have another function which could be called within that function which executes anothr block of code. So generally an app is just a bunch of functions calling one another throughout its life cycle executing code blocks

// so instead of having all the code within one large file we will create a mulitple functions which will execute smaller blocks of code and each function should have its own singular purpose

// today we will go over how to write basic functions, their syntax and small tid bits to help you in the journey


// as stated before an app really can be defined as a sequence of functions that are inside files

//previously we have been writing code like such

var myItem: Bool = false

myItem = true

print(myItem)

// and yes while this is how we write code, and its fine for the playground and understanding topics as you go along but in reality this is not how an app works, an app works with code thats divided into functions inside respective files

// the way we go by creating a function is as follows

func myFirstFunction() {
    
}

// similar to an if statement it has a closure, however this closure will only execute when we call on the function, we can see this happening below where the print statement isnt being printed out for us in the console...

func myFirstTestFunction() {
    print("my first function called")
}

// to call a function we would go ahead like this:

myFirstTestFunction()

// there is an initial function somewhere the app creates and then youll tell the app to go to a specifc file and ask it to do things which then will call the functions within...

// you can also chain the functions with in functions eg:

func mySecondFunction() {
    print("called")
    myThirdFunction()
}

func myThirdFunction() {
    print("called 3")
}
// its a normal process to chain functions and have one call another and so on

// complex exampls

func getUserName() {
    let userName = "Nick"
    print(userName)
}

getUserName()

// the constant of the username is set up within the closure, meaning it cant be accessed outside the scope of that function since its private to the function, if it was declared outside the function it will be public to the file... this will make more sense the more indepth we go with access control

// if we only need it in the scope of the function rather create it inside the function as devs we want to keep things as private as we can.

// to return a value out of a function -> String this will return some string, we can return any data type in the function

func newUsername() -> String {
    let userName = "Nick"
    return userName
}
// this means we can set a variable to the value from the function like such

let name = newUsername()

func checkIfUserIsPremium() -> Bool {
    return false
}


// ---------------

var userDidCompleteOnboardings = false
var userProfileIsCreateds = true

func checkPersonStatus() -> Bool {
    if userDidCompleteOnboardings && userProfileIsCreateds {
        return true
    } else {
        return false
    }
}

// its not common to have global variables and is frowned upon so you want to either keep them in a viewModel or in the scope of the function like such

func showFirstScreen() {
    var userDidCompleteOnboarding = false
    var userProfileIsCreated = true
    
   let status =  checkUserStatus(didCompleteOnboarding: userDidCompleteOnboarding,
                                 profileIsCreated: userProfileIsCreated)
    if status {
        print("no show")
    } else {
        print("show the onboarding")
    }
}

// since the variables arent global we neeed to pass the values as paramaters into the functions like so ... then we need to use the new variables from the parameter to fit in our logic

func checkUserStatus(didCompleteOnboarding: Bool, profileIsCreated: Bool) -> Bool {
    if didCompleteOnboarding && profileIsCreated {
        return true
    } else {
        return false
    }
}

// we can also chain functions with their initialisers..this will be how we move the data around our app..
// -------------------------------

//control flow within functions
doSomething()
func doSomething() {
    // if we dont return anything it is the same as returning Void...
    print("execute 1")
    
    var isNew: Bool = false
    
    if isNew {
        print("New")
    } else {
        print("old")
    }
    
// since we dont return anything we dont have to go into an else.. if we were returning a string in this case we would need to return an else or return a string if the isNew isnt tue
}

func doSomethingElse() {
    var title: String = "Avengers"
    // guard means make sure its equal to or make sure
    guard title == "Avengers" else {
        return print("")
        // this only executes if we dont have avengers as the titke
    }
    
   return print("")
}
//guard lets you check out of the function early... if and guard  are the same things with exceptions, if allows you to hit the closure if something is true where as the guard lets you hit the closure if something is false

//creating a calculated variable : COmputed variables are basically functions

let number1 = 5

let number2 = 8

func calculateNumbers() -> Int {
    return number1 + number2
}
func calculateValues(value1: Int, value2: Int) -> Int {
    return value1 + value2
}

let result1 = calculateNumbers()
let result2 = calculateValues(value1: number1, value2: number2)

// instead we can create a computed variable that works like a function

// although they are simialr the calculated variable is of Int and not returning an Int

var calculatedVariable: Int {
    return number1 + number2
}

// this will execute everytime you call it, if you dont need to pass a function paramaters, then this becomes good and useful...
