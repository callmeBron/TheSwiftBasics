import Foundation

// Protocols
/// High level introduction to protocols
/// Since all swiftUI views conform to the view protocol its important going forward to have a base line understanding of what that means

/// lets say we have a company filled with employees and employee records
struct EmployeeModel: EmployeeRequirements {
    let occupation: String
    let name: String
}

/// currently this struct does not conform to any protocols, so lets create our first protocol.
/// protocols are a set of requirements or laws that an object should follow if it conforms to it

protocol EmployeeRequirements {
    let occupation: String
    let name: String
}

/// when an object conforms to a protocol but doesnt have any of the requirements youll be prompted to insert protocol stubs, which would support the rules or requirements of the protocol.
