import Foundation

    // Welcome to everything Struct related
    
    /* Moving on from the Object Oriented talk, we will deep dive into Structs.
     Structs are value types and are stored in the stack */
    
    // Some Key Points of Structs
    ////  structs are fast
    ////  structs are stored in the Stack (memory)
    ////  objects in the stack are Value types
    ////  value types are copied and mutated
    
    struct Quiz {
        let title: String
        let dateCreated: Date
    }
    // so far we have been using basic types such as
    let myObject: String = " This is my Object "
    
    // so let dive deeper into using structs as a type ------
    
    /// youll notice that when we set a value for our quiz object below it gives us the initialiser as a completion. i.e Quiz(title: String, datecreated: Date)

    /// all this is doing is telling us that if we are wanting to create an object of the quiz we will need to give it the required values, i.e the title and date created.

    /// This is no different than calling a function for example.

    let myQuiz: Quiz = Quiz(title: "quiz 1",
                            dateCreated: .now)
    
    // maybe in the code we would want to access the title we would then do it as such

        print(myQuiz.title)
    
    // Lets examine the Quiz(title: String, datecreated: Date) object, where did the closure come from?
    
    /// Structs have what we call an implicit init, an essentially what that means is that the compiler is generating the initializer for us.
    /// It is a function which is an initializer for the object

    // We arent bound to just allowing the compiler to create that init for us, the cool thing is that we can create it manually, by using the init() { } method in the struct.
    
    /// This is a convieneience thing in swift.

    /// This will allow us to setup the values when the object is called.

    /// The init(title: String, dateCreated: Date) { ... } is the equivalent to the above Quiz(title: String, datecreated: Date)
   
    
    struct InitQuiz {
        let title: String
        let dateCreated: Date
        
        init(title: String, dateCreated: Date) {
            self.title = title
            self.dateCreated = dateCreated
        }
    }
    
    // Why would we ever need to manually create the init?
    
    /// if we create our we will be able to customise it ourselves to suit our specific use cases
 
    /// for example maybe everytime we create a Quiz we want to pass it a title, but perhaps we arent necesarily looking to pass a dateCreated value and we rather want it to rely on a defaulted value...
    
    
    struct CustomInitQuiz {
        let title: String
        let dateCreated: Date
        
        init(title: String, dateCreated: Date = .now) {
            self.title = title
            self.dateCreated = dateCreated
        }
    }
    
    /// so now if we create a new customInitQuiz object, we can see that the parameters are a little different, firstly dateCreated is italicised and greyed out, this is because we dont need to pass a value as it has a defaulted value it can rely on making out object look like this CustomInitQuiz(title: String )
    
    let quiz2 = CustomInitQuiz(title: "String 2")
    
    // Using optionals inside Structs
    /// Yes it is possible to create a struct which has optional values
    
    struct PremiumStruct {
        let title: String
        let dateCreated: Date
        let isPremium: Bool?
        
        init(title: String, dateCreated: Date?, isPremium: Bool?) {
            self.title = title
            self.dateCreated = dateCreated ?? .now
            self.isPremium = isPremium
        }
    }
    
    /// with an optional value we can give it a value of nil, in this example where isPremium is an optional bool, we could provide it with 1 of 3 values.  True, False or nil.
    
    /// and we saw we could actually pass it an optional value despite its original referenced property being required, this will then cause us to have to unwrap the value.
    
    /// self.dateCreated = dateCreated ?? .now : this has a look at the initialiser and says either date created will be the value we pass it in otherwise if you cant find that value we want you to use the default value of  .now
    
    let quiz3 = PremiumStruct(title: "quiz3",
                              dateCreated: nil,
                              isPremium: false)
    
// --------------------------------------
    
    // Mutating Structs -----
    
    /// in this example  UserDataModel is what is known as an immutable struct catergorised by the let properties (immutable) which means we cannot mutate the struct.
    
    /// the benefit is if we pass this around the app in different files, because the values are constants we are assured the data is never changing. So no matter where it is in the code the values will never change.
    
    struct UserDataModel {
        let name: String
        let isPremium: Bool
    }
    
    var user1: UserDataModel = UserDataModel(name: "Dan",
                                             isPremium: false)
    
    /// what if we had a function which wanted to mark users as isPremium users, since our struct is immutable, we would have to create a second struct with the same data but change the boolean value.
    
    /// so here we created a user model, and then to change the value we created a second model and using existing data and changing the one we needed.
    
    func markUserAsPremium() {
        print(user1)
        user1 = UserDataModel(name: user1.name,
                              isPremium: true)
        print(user1)
    }

    markUserAsPremium()
    
    /// This is a very manual process of updating a struct and likely not one we are going to use, so lets take a look at a different approach: Using Mutable structs
    /// yes categorised by the variable declaration
 
    struct UserDataModel2 {
        let name: String
        var isPremium: Bool
    }
    
    var user2 = UserDataModel2(name: "Daniel",
                               isPremium: false)
    
    /// instead of creating a new object and changing it we will just change the one mutable property.
    
    /// This is updating the struct to set the premium value as a new value
    
    func markUserAsPremium2() {
        print(user2)
        user2.isPremium = true
        print(user2)
    }

    markUserAsPremium2()
    
    // Another way to update a struct within itself.
    
    // Mutating immutable structs
    
    /// this is a better coding practice because the struct is incharge of changing its value
    
    struct UserDataModel3 {
        let name: String
        let isPremium: Bool
        
        func markUserAsPremium3(newValue: Bool) -> UserDataModel3 {
            UserDataModel3(name: name,
                           isPremium: newValue)
        }
    }
    
    var user3: UserDataModel3 = UserDataModel3(name: "Meg", isPremium: false)
    user3 = user3.markUserAsPremium3(newValue: true)
    
    // Mutating Mutable structs from within
    
    /// youll notice that it is going to complain because self is immutable... ( Cannot assign to property: 'self' is immutable )

    /// Yes while the code that we are targeting is mutable, we are within the struct itself, when we mutate an object we are copying and pasting a new value, when we go now in this example to mutate the value we will be creating a new struct completely.
    
    /// so whats the problem?  well if we are running functions within the struct, it could cause crashes and issues down the line as it is losing reference , destroying the initial struct and creating a whole new object.
    
    /// The work around to this is by marking the function as mutating so that the struct knows this function will be changing.

    /// The benefit of this, vs the UserDataModel2 method is, the only time this will be updated would be within the struct itself.
    
    struct UserModel4 {
        let name: String
        /// marking something as 'private(set)' means we can only set the value for isPremium within the struct.
        private(set) var isPremium: Bool
        
        mutating func markUserAsPremium4() {
            isPremium = true
        }
        
        mutating func updateIsPremium4(newValue: Bool) {
            isPremium = newValue
        }
    }

