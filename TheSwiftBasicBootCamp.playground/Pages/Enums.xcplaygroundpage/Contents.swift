//: [Previous](@previous)

import Foundation

// Understanding enums

/// enums are very similar to structs in the way they way they work behind the scenes, so how they are stored in memory and things like that

/// Key difference: At runtime we know all the cases or versions of the enum, whereas a struct we dont need to know all the cases at the runtime.

/// 💭...
/// imagine youre building a restuarant app, so imagine there are a bunch of cuisines: Italian, Mexican || Asian.

/// Now in one version we will download the data from the internet, so in this case when writing our code we dont know what the cuisines are going to be that we are given, so in this case we would use a struct for the cuisines

/// In another scenario we already know the versions of cuisine we want to use, so in this instance we would want to use an enum.

/// on a high level, if we can use an enum we would prefer that to a struct....

/// lets create a new struct for a Car
struct CarModel {
    let brand: String
    let model: String
}

var car1: CarModel = CarModel(brand: "Ford", model: "Fiesta")
var car2: CarModel = CarModel(brand: "Audi", model: "R8")
var car3: CarModel = CarModel(brand: "Toyota", model: "86")

/// in this example we could put anything into the brand for example 'Burger King'  which is most definitely not a car brand.
/// we would want to then use an enum to restrict brand to specific values only.

/// lets look into another struct example that we could use
struct CarModel2 {
    let brand: CarBrand
    let model: String
}

struct CarBrand {
    let title: String
}
/// instead of asking for a generic string , CarModel2(brand: string, model: string), it will now propmt us to give it a CarBrand(title: String)

var carA: CarModel2 = CarModel2(brand: CarBrand(title: "Ford"),
                                model: "Fiesta")
var carB: CarModel2 = CarModel2(brand: CarBrand(title: "Audi"),
                                model: "R8")
var carC: CarModel2 = CarModel2(brand: CarBrand(title: "Toyota"),
                                model: "86")

/// or we could create a whole seperate variable to clean this up
var ford: CarBrand = CarBrand(title: "Ford")
var carD: CarModel2 = CarModel2(brand: ford,
                                model: "Focus sport")

/// however we still run into the unfortunate issue of allowing anyone to input any title into CarBrand which might not be an actual car brand and messing up our app.

/// So then why would we even suggest it as a struct or why would we look into this method, that would be if at runtime of the app we dont know all the potential brands we would be getting back from a service.

/// But if we know all the brand within our app, that wouldnt change we would want to create enumeration.

/// Main difference in a struct we can configure it with totally custom data, for an enum we have to tell it all the potential versions of this enum that there are ever going to be.

enum CarBrandOption {
    case ford
    case toyota
    case audi
}

struct CarModel3 {
    let brand: CarBrandOption
    let model: String
}
/// to access the enum values we would use the dot notation ( . ) to reveal all the potential  options and choose the correct option.
var carE: CarModel3 = CarModel3(brand: .audi, model: "TT coupe")

/// we do prefer enums when we can use them, the only problem is that we would need to know all cases, but if we are relying on a database then we would lean on the struct

// Writing enums in Short hand method

enum CarBrands {
    case honda , suzuki, volkswagen
}

// Storing an enum in Memory
/// Enums are stored similarly to structs in memory, however they are immutable

// Creating Computed Variables in enums

enum CarBrandOption2 {
    case ford
    case toyota
    case audi

    /// if the option is equal to specified options
    var title: String {
        if self == .audi {
            return "Audi"
        } else if self == .ford {
            return "Ford"
        } else {
            return "default"
        }
    }
}

/// now if we  created a variable of audi, the version of self we are calling it on is the audi case

var audiBrand: CarBrandOption2 = .audi

audiBrand.title

/// the problem with this, is that we would have to set the value for all cases, in the above example we see that if self was toyota it would have the title of  default which isnt correct.

/// A better solution is to use a switch statement, it is similar to an if statement, but it ensures that we are using all of the cases which are possible.

enum CarBrands2 {
    case honda , suzuki, volkswagen
    var title: String {
        /// when using a switch statement, the compiler will tell us that hey 'Switch must be exhaustive' which means they need to  use all cases that is possible.
        /// if we didnt want all the cases we could use a default value, so cases we dont cover will fall into the default ( which we would want to rather cover all cases )
        switch self {
        case .honda:
            return "Honda"
        case .suzuki:
            return "Suzuki"
        case .volkswagen:
            return "VolksWagen"
        }
    }
}


//: [Next](@next)
