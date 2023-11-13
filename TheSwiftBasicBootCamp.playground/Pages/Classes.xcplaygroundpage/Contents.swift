//: [Previous](@previous)

import Foundation

// Class Basics

/// Classes are reference types.
/// Compared to value types these fundamentally work differently behind the scenes, and because of that the way that we use them is different.

/// in reality it is easier to use a class over a struct, but that doesnt mean we should opt for classes over structs all the time...
/// ... most of the time we would prefer a struct to a class but there are absolutely times where we need to use a class over a struct

/// when we create a class we  say we create an instance of a class, and that class is pointing to an object in memory, because of this, the way we go about updating classes are different, we dont mutate it like a struct we actually update the object in memory.

// Class Key Points
/// Classes are slow in comparison to structs
/// Classes are stored in the Heap (memory)
/// Objects in the Heap are reference types
/// Reference types point to an object in memory and update that instance.


// Differences between Classes and Structs
/// Structs are value types VS Classes as reference types
/// Structs have implicity Inits VS Classes need default values or a manual init
/// Structs are stored differently to Classes
/// Structs are faster that Classes
/// Classes have a Deinit, which allow us to destroy an object from memory
/// Structs are thread safe
/// Structs have lower memory footprint

//Why would we use a class
/// Because when we go to edit it we update the object in memory, we do not copy the object mutate it and create a new object.
/// Classes are better for when you have an instance inside your app and you would want to do things inside of it and have it hang out in the app


// Lets begin!

/// 🤔 ViewModel is a term used within app architecture, which in short is a structure for how we will organise all the code within the app, ViewModel comes from one of the structures called Model View ViewModel (MVVM).

/// In SwiftUI ViewModels are mainly classes, Why?
///  you generally want to change the data on it from within the view model itself. The logic within the view model should be able to change the data.

/// This class has all of the data needed for some screen
class ScreenViewModel {
    let title: String
    var showButton: Bool
}

/// In this example we have a struct called Screen1 and this has a reference to the data (ViewModel)

struct Screen1 {
    
}

/// In object orientated programming we discussed the idea of Initialising (init) an Object (Allocating/Adding to memory).

/// Structs have an implicit init, where are Classes do not have that, youll notice if you add properties to a class and do not create an init(){} method youll face the error ' Class 'ScreenViewModel' has no initializers '

/// However one thing to note, is that if you dont init your Class, we could also provide default values for the properties, as there would be nothing to initialise
/// i.e
/// let title: String = "Welcome to the App" ||  let title: String = ""

class ScreenViewModel1 {
    let title: String
    var showButton: Bool
    
    init(title: String, showButton: Bool) {
        self.title = title
        self.showButton = showButton
    }
    
    deinit {
        /// this runs as the object is being removed from memory
        /// structs do not have deinit, because the nature of structs being value types
    
        
    }
}

// Updating Values in a class
/// when we create the viewModel it is being stored in memory and the variable the becomes the pointer to the object within memory.
/// so we will point to the object in memory and change the value in memory

/// Important: we defined the class as a let constant where if you go back, we defined all structs as variables because we were creating new object when mutating values, where are with the class we wont be recreating the object but rather updating the values within.
/// As  long as the value within you are changing is a var of course :)

let viewModel: ScreenViewModel1 = ScreenViewModel1(title: "explore screen", showButton: true)
viewModel.showButton = false

// Updating Values in the class within the class
/// while we did update values outside of the class it is prefered to update them within.
/// And we can then call the functions outside

class ScreenViewModel2 {
    let title: String
    var showButton: Bool
    
    init(title: String, showButton: Bool) {
        self.title = title
        self.showButton = showButton
    }
    
    func hideButton() {
        showButton = false
    }
}

let viewModel2: ScreenViewModel2 = ScreenViewModel2(title: "help screen",
                                                    showButton: true)
viewModel2.hideButton()

/// we could take it a step futher to align with clean code
/// in the class we can make the value of showButton a private(set) which will then only allow us to update that value from within the class itself

class ScreenViewModel3 {
    let title: String
    private(set) var showButton: Bool
    
    init(title: String, showButton: Bool) {
        self.title = title
        self.showButton = showButton
    }
    
    func hideButton() {
        showButton = false
    }
}

let viewModel3: ScreenViewModel3 = ScreenViewModel3(title: "feed screen",
                                                    showButton: true)
viewModel3.hideButton()

/// if you attempted now to update the value as such, you should be greeted with this lovely error message: ' Cannot assign to property: 'showButton' setter is inaccessible '

viewModel3.showButton = false

//: [Next](@next)
