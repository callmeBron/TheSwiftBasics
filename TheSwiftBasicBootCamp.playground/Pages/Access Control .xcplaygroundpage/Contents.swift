//: [Previous](@previous)
import Foundation
import UIKit
import SwiftUI

//Access Control Basics

/// Here we will be focusing on what it means to make something private VS public

/// Generally speaking in a high level we want to make things as private as possible
/// which means when we can make something private we probably should.

/// It is important to make things private correctly this is more so important when working in a team, when another dev see that something is marked private a few implications that will go through their head, and it explains how this piece of code should be updated.
/// When it comes to debugging and viewing code etc, it is a huge head start for dev teams.

// Lets check examples:

/// lets imagine we are creating a movie viewing app
/// youll notice in this example we are using all the concepts simutaneously, there isnt a thing of picking on and then just relying on that throughout an app.


enum MovieGenre {
    case comedy, action, horror
}

struct MovieModel {
    let title: String
    let genre: MovieGenre
    let isFavourite: Bool
    
    func updateFavoriteStatus(newValue: Bool) -> MovieModel {
        return MovieModel(title: title,
                          genre: genre,
                          isFavourite: newValue)
    }
}

class MovieManager {
    /// public
   public var movie1 = MovieModel(title: "Avatar",
                            genre: .action,
                            isFavourite: false)
    /// private
   private var movie2 = MovieModel(title: "The proposal",
                            genre: .comedy,
                            isFavourite: false)
    
    /// private(set): read is public, write is private
    private(set) var movie3 = MovieModel(title: "Spider-man",
                            genre: .action,
                            isFavourite: true)
    var movie4 = MovieModel(title: "The exorcist" ,
                            genre: .horror,
                            isFavourite: false)
}

let manager = MovieManager()

/// now lets create a function where we can update the movie model favourite status
struct EgMovieModel {
    let title: String
    let genre: MovieGenre
    let isFavourite: Bool
    
    func updateFavoriteStatus(newValue: Bool) -> MovieModel {
        return MovieModel(title: title,
                          genre: genre,
                          isFavourite: newValue)
    }
}

/// now if we wanted to update the version of the movie
manager.movie1 = manager.movie1.updateFavoriteStatus(newValue: true)
print(manager.movie1)

// Back to Access Control ( most common )
/// The properties above are actually all public... which means anything inside or outside the class can mutate the object.
/// i.e var movie1 == public var movie1

// Public level
/// This means we can both get the value of an object and set the value of the object from within or outside of the object its defined in...
/// We dont normally include the public keyword, unless in the case you are writing your own frameworks then we would go about marking objects as public.
    public var text: String = ""

// Private level
/// Means we can NOT get or set the object from outside the class.
/// Usually if you do try to update or mutate the private value from outside youll get the error message:  'variable' is inaccessible due to private protection level
    private var text2: String = ""
    private(set) var text3: String = ""

/// private(set) VS private :
/// The difference here is with private(set) we are specifiying that we would not be able to set a new value however we are able to read the value, where private both of those are things we can NOT do

// Access control within the example

/// Version 1
/// we can GET and SET the value from outside the object
/// considered 'too public' and not good coding
    let movie1 = manager.movie1
    manager.movie1 = manager.movie1.updateFavoriteStatus(newValue: true)

/// Version 2
/// we can NOT GET or SET the values from outside the object, results in errors.
    let movie2 = manager.movie2
    manager.movie2 = manager.movie1.updateFavoriteStatus(newValue: true)

/// Version 3
/// we can GET value from outside the object but we cant set the value
/// "arguably best practice"
    let movie3 = manager.movie3

//-----------------
// Other levels of Access control
// public and private are the most common uses of access control, however there are many more types and levels:

// open / public ( least restrictive )
/// Enable an entity to be used outside the defining module (target).
/// You typically use open or public access when specifying the
/// public interface to a framework.
/// public classes and class members can only be subclassed and overridden within the defining module (target).
/// open classes and class members can be subclassed and overridden both within and outside the defining module (target).

    open class UITableView : UIScrollView {}
    public func A(){}
   

// internal ( default access )
/// internal is the default access level. Internal classes and members can be accessed anywhere within the same module(target) they are defined. You typically use internalaccess when defining an app’s or a framework’s internal structure
    internal func internalMethod() {}
// fileprivate
/// Restricts the use of an entity to its defining source file. You typically use fileprivate access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.
    fileprivate func someFunction() {}

// private ( most restrictive )
/// Private access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. You typically use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.
    private var name = "First Letter"

// in Closing...
/// If objects arent marked as private they are seen as public/internal and the rule of thumb is everything should be as private as possible so we can set up expectations for the specific object.
/// This habit will make your code easier to read and debug

//: [Next](@next)
