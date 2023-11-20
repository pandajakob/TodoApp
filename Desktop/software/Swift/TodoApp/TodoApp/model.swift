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
    
}

struct MainInformation {
    var description: String
    
}



extension Task {
    
    static var tasks: [Task] = [
            Task(mainInformation: MainInformation(description: "Complete homework"), isCompleted: false),
            Task(mainInformation: MainInformation(description: "Read a book"), isCompleted: true),
            Task(mainInformation: MainInformation(description: "Go for a run"), isCompleted: false),
            Task(mainInformation: MainInformation(description: "Write a blog post"), isCompleted: true),
            Task(mainInformation: MainInformation(description: "Learn a new programming language"), isCompleted: false),
            Task(mainInformation: MainInformation(description: "Cook a new recipe"), isCompleted: false),
            Task(mainInformation: MainInformation(description: "Attend a meetup"), isCompleted: false),
            // Add more tasks as needed
        ]
}

    
