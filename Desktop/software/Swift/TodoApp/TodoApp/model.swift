//
//  model.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 19/11/2023.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    
    var mainInformation: MainInformation
    var isCompleted: Bool
    
    mutating func completed() {
        isCompleted.toggle()
    }
    
    var dueDate: Date
    var completionDate: String = "Not Completed"
}

struct MainInformation {
    var description: String
    
}



extension Task {
    
    static var tasks: [Task] = [
         Task(mainInformation: MainInformation(description: "Complete homework"), isCompleted: false, dueDate: Date().addingTimeInterval(86400)), // Due tomorrow
         Task(mainInformation: MainInformation(description: "Read a book"), isCompleted: true, dueDate: Date().addingTimeInterval(172800)), // Due in 2 days
         Task(mainInformation: MainInformation(description: "Go for a run"), isCompleted: false, dueDate: Date().addingTimeInterval(259200)), // Due in 3 days
         Task(mainInformation: MainInformation(description: "Write a blog post"), isCompleted: true, dueDate: Date().addingTimeInterval(432000)), // Due in 5 days
         Task(mainInformation: MainInformation(description: "Learn a new programming language"), isCompleted: false, dueDate: Date().addingTimeInterval(604800)), // Due in 7 days
         Task(mainInformation: MainInformation(description: "Cook a new recipe"), isCompleted: false, dueDate: Date().addingTimeInterval(1209600)), // Due in 14 days
         Task(mainInformation: MainInformation(description: "Attend a meetup"), isCompleted: false, dueDate: Date().addingTimeInterval(1814400)), // Due in 21 days
         // Add more tasks as needed
     ]
}

    
