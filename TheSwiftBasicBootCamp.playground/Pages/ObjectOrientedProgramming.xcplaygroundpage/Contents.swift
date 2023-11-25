import SwiftUI

// this is going to be a high level of object oriented programming in terms of swift
// here we will take a look into creating and destroying onjects, what it means to init or deinit an object and what it means to put something into memory, what are we doing when we allocate and deallocate something into memory
// then we will move into what is the actually memory we are using, looking into stack vs heap
// then we  dive into objects which would be in that kind of memory like structs and classes (These are custom types we can create in our code!)

// -----------------
//OOP

// During the lifecycle of an app, we create and destroy objects, so when we need an object we will create one, and when we dont need it anymore we will destroy it
// the term create means to initialize (init), when we do this we are really adding it to memory, and we do this through the init which is the first function which creates the object
// the term destroying objects means to deinitialize (deinit), normally we dont go ahead and write a deinit, we usually allow the code to do this automatically.. this deallocates the object from memory

// -----------------
// (ARC)

// swift has something called automatic reference counting (ARC)
// this is a live count of the number of objects in memory
// init 1 object the count goes up by 1
// if we init 2 object the count goes up by 2
// if we deinit 1 object the count goes down by 1

// The more objects in memory the slower the app preforms - so we want to keep the ARC count as low as possible, which means as low as we can given the amount of objects that are NEEDED... and we want to destroy the objects as soon as we no longer need them

// if the app has 2 screens and the user moves from screen 1 to screen 2. we only want to allocate screen 2 WHEN we need it (when the user presses the button to go to that screen), and when we get to screen 2, we may want to deallocate screen 1, if it isnt needed.

// -----------------
// Stack vs. Heap

// on an iphone we have 2 types of memory a Stack & Heap
// only objects in the Heap are counted towards to the ARC

//Objects in the Stack
//This holds basic types : String, Int, Dates and most of your basic types
//Structs and Enums

// Objects in the Heap
// functions are in the heap
// Classes and Actors

// This means classes are stored differently from structs

// The iphone is known as a 'multi-threaded enviroment'
// you run things on a thread within ios which you can think of as an engine
// there are also multiple threads running simutaneously.
// each thread has its own stack, but there is only one heap for all the threads

// therefore the stack is faster than the heap and the heap is slower, because the heap is being one heap for all the different threads, whereas the stacks can act independantly

//generally speaking:

// stack has a lower memory footprint
// heap has a higher memory footprint

// this makes stacks preferable, and this is why generally every screen we create we create as a struct because they are faster , lower memory footprint and this is why swiftui apps are highly performant

// what is technically different between the objects that allow some to be in stacks vs others in heaps
// underlying that is a thing called: Value vs Reference types

// -----------------
// Value vs Reference types

// objects in the stacks are value types and when you edit a value type you are essentially creating a copy of it with new data.

// so if we have a boolean as true, and then change it to false, we are actually creating a new copy of it with a new value. Such as copy and paste but when you paste it has a new value, so when youre doing this there is a new object and an old object, its not the same object you have changed

// objects in the heap are reference types, so when you edit the object you are not creating a new object but editing the initial one created. This 'referenc' is what we call a pointer, because it points to an object in the heap (in memory).

// So we will point to the object and edit its value in place

// stacks has little risk of threading issues
// heaps have high risk of threading issues

//Creating a struct

struct MyFirstStruct() {
    let title: String = ""
}

//Creating a class
class MyFirstClass() {
    let title: String = ""
}

// so at face value these objects look identical, and when creating them, there isnt anything that really tells you much about the differences


// Class vs Struct : explained to a 5-year old

//imagine school and in the school there are classrooms.
// within each class, there are quizzes
// during the day, the teacher will hand out many different quizzes to different classes. The students will answer the quizzes and return them back to the teacher
// 'school' is our app
// 'classroom' is our class
// 'quiz' is our struct

// the classroom is in place and not moving, and we go inside to do things.
//
// value types are smaller pieces of data we can move around.


// when to use what

// we want to use a class for things like :
// "Managers" "DataService" "Service" "Factory" "ViewModel"
// objects we want to create and perform actions inside

// we want to use a struct for things like :
// Data Models
// objects we want to create and pass around our app

