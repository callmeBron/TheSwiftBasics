//: [Previous](@previous)

import UIKit

// we are using doubles because we are going to do math within this example, generally when doing something with math i.e. division you want to stick to using doubles rather than integers as they go beyond just a whole number.

///var likeCount: Double = 5
///var commentCount: Double = 0
///var viewCount: Double = 100

// how to update a Double

///likeCount = 5 + 1

//// ^^ this is considered bad programming as we are defining its initial value again, for example if its original value was 4 and not 6, we would still be getting six as a result with this approach as we are defining a new value all together for it.

// addition -------
////
/// likeCount = likeCount + 1 // this will take its initial defined value and add one.

/// likeCount += 1 // this will be an easier line of code to do something exactly the same

// subtraction -----
/// likeCount = likeCount - 1
/// likeCount -= 1
//
// multiplication ----
/// likeCount = likeCount * 1.5
/// likeCount *= 1.5

// Division ----
///likeCount = likeCount / 2
///likeCount /= 2

//// Order of Operation is extremely important and indeed does matter!
////Pedmas - the same way you would write mathematial operations in math it applies in code

/// likeCount = likeCount - 1 * 1.5 // multiplication takes priority over addition and subtraction
/// likeCount = (likeCount - 1) * 1.5 // here the brackets would execute first


var likeCount: Double = 5
var commentCount: Double = 0
var viewCount: Double = 100

likeCount += 1

print(likeCount)

// using like count as an example of how we are able to use operators in if-statements

if likeCount == 5 {
    print("post has 5 likes")
} else {
    print("post does not 5 likes")
}

if likeCount != 5 {
    print("post does not 5 likes")
} else {
    print("post has 5 likes")
}

if likeCount > 5 {
    print("post has greater than 5 likes")
}

if likeCount < 5 {
    print("post has less than 5 likes")
}
if likeCount <= 5 {
    print("post has less than or equal to 5 likes")
}
if likeCount >= 5 {
    print("post has greater than or equal to 5 likes")
}

// using two conditions on an  if-statement
/// if like count is greater than three AND commentCount is greater than 0
    /// the else will be executed if the likes are less that 3 AND comments are less than zero
        /// the parenthesis is to exemplify that they are two different conditions

if (likeCount > 3) && (commentCount > 0) {
    print("post has greater than 3 likes AND greater than 0 comments")
} else {
    print("Post has 3 or less likes OR post has 0 or less comments")
}

// we can use an || OR operator to allow the code to run if one of the conditions are true or met.
 /// this will execute the first code block if the code finds one of these conditions to be true

if (likeCount > 3) || (commentCount > 0) {
    print("post has greater than 3 likes OR greater than 0 comments")
} else {
    print("Post has 3 or less likes AND post has 0 or less comments")
}

// and this does become easier when working with Booleans
var userIsPremium: Bool = true
var userIsNew: Bool = false

if userIsPremium  && userIsNew {
    
}


/// as we get into writing longer code and more difficult functions the logic in our code will get more complex, so we need to have a solid foundation of the operators because youre going to be in functions and as a developer youll need to know when the closures will execute and if you dont understand the operators  youll get very confused when what will execute first and as a developer it will be unproductive and slow you down

/// we can chain these &&'s and ||'s , meaning in an if statement youre able to have as many of these operators as you like. Now code is meant to be as simple as possible so i wouldnt necessarily take this approach if you dont need it

if likeCount > 3 && commentCount > 0 || viewCount > 50 {
   /// and even tho the first condition might be false the or has that the second condition can be true which willl exectue the first code block and not run into a potential else
}

/// in this example the order of operations will come into play and the above will be read as such by the complier " if (likeCount > 3 && commentCount > 0) || viewCount > 50"

//: [Next](@next)
