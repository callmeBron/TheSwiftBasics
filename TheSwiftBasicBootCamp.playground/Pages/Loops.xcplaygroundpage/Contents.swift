import Foundation

// Loops
/// Loops go through our collections of data and allow us to access specific pieces of data.


// For-loops
/// <for item in collection>

/// we can loop through a specific range of numbers
/// for each item or number within 0 to 100, which means we will loop through this 100 times, and it will set the number/item to the current value it is at.
/// we commonly start at 0 as most of the time we use arrays and their indexes start at 0.
for _ in 0..<100 { }

// looping through a collection of data
var myArray: [String] = ["Alpha","Beta","Gamma","Delta","Epsilon"]
var secondArray: [String] = []
for item in myArray {
    /// then we provide logic
    print(item)
    if item == "Gamma" {
        secondArray.append(item)
    }
}

print(secondArray)
/// we can also use guard and if statements to manipulate looping data.
/// i.e
struct LessonModel {
    let title: String
    let favourite: Bool
}

let allLessons = [
    LessonModel(title: "Math", favourite: false),
    LessonModel(title: "English", favourite: false),
    LessonModel(title: "Spanish", favourite: true),
    LessonModel(title: "Drama", favourite: true)
]
var favouriteLessons: [LessonModel] = []

for lesson in allLessons {
    if lesson.favourite {
        favouriteLessons.append(lesson)
    }
}

/// Another case is if we are looping through data to display on the screen
/// like instagram, opening and swiping the feed, those items are very likely to be an array and they are probably saying for post in posts, display item on screen.

// Indexes and loops
/// sometimes when looping we want to have access to specific indexes
/// enumerated returns us a sequence of n and x , n being the index and x the associated value.
///  by using this lesson needs to be updated to use (n, x) format, which  gives us access to working with both the value and index

for (index,lesson) in allLessons.enumerated() {
    print("index: \(index) || lesson: \(lesson.title)")
    if index < 2 {
        //do some manipulation
    }
    
}

// Control flow
/// so we are looping over items, but what if we wanted to loop through until a specific condition
for (index,lesson) in allLessons.enumerated() {
    if index == 1 {
        /// breaking the loop when we get to index one, so we stop at that point
        break
    }
    print("index: \(index) || lesson: \(lesson.title)")
}

/// alternative of break is continue
for (index,lesson) in allLessons.enumerated() {
    if index == 1 {
        /// this says dont finish the loop and continue to the next loop, when we get to index 1 which would run 0..2..3
        continue
    }
    print("index: \(index) || lesson: \(lesson.title)")
}
// ------------

// While loops
/// A  while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations isn’t known before the first iteration begins. Swift provides two kinds of while loops:
/// while evaluates its condition at the start of each pass through the loop.
/// repeat-while evaluates its condition at the end of each pass through the loop.

/// While:
/// A while loop starts by evaluating a single condition. If the condition is true, a set of statements is repeated until the condition becomes false.
var likeCount: Int = 0
var canPromote: Bool = true

while likeCount < 100 && canPromote {
    promotePost()
    likeCount += 1
}
func promotePost() {
    /// runs potential promoting logic
}

/// Repeat-While
/// The other variation of the while loop, known as the repeat-while loop, performs a single pass through the loop block first, before considering the loop’s condition. It then continues to repeat the loop until the condition is false.

repeat {
   promotePost()
} while likeCount < 100 && canPromote == true
