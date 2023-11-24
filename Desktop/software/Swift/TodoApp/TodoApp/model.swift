//
//  model.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 19/11/2023.
//

import Foundation


struct SortedTask: Identifiable {
    var id = UUID()
    var date: Date
    var tasks: [Task]
    
}


struct Task: Identifiable {
    var id = UUID()
    
    var mainInformation: MainInformation
    var isCompleted: Bool
    
    mutating func completed() {
        isCompleted.toggle()
    }
    
    var dueDate: Date
    var completionDate: Date = Date()
    
    init() {
        self.init(mainInformation: MainInformation(description: ""), isCompleted: false, dueDate: Date.now, completionDate: Date.now)
    }
    
    init(id: UUID = UUID(), mainInformation: MainInformation, isCompleted: Bool, dueDate: Date, completionDate: Date) {
        self.id = id
        self.mainInformation = mainInformation
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.completionDate = completionDate
    }
    

    
}

struct MainInformation {
    var description: String
    init(description: String) {
        self.description = description
    }
}



extension Task {
    
    static var tasks: [Task] = [
        Task(mainInformation: MainInformation(description: "Complete homework 📚"), isCompleted: false, dueDate: Date().addingTimeInterval(86400), completionDate: Date()), // Due tomorrow
        Task(mainInformation: MainInformation(description: "Read a book 📖"), isCompleted: true, dueDate: Date().addingTimeInterval(172800), completionDate: Date()), // Due in 2 days
        Task(mainInformation: MainInformation(description: "Go for a run 🏃‍♂️"), isCompleted: false, dueDate: Date().addingTimeInterval(259200), completionDate: Date()), // Due in 3 days
        Task(mainInformation: MainInformation(description: "Write a blog post ✍️"), isCompleted: true, dueDate: Date().addingTimeInterval(432000), completionDate: Date()), // Due in 5 days
        Task(mainInformation: MainInformation(description: "Learn a new programming language 💻"), isCompleted: false, dueDate: Date().addingTimeInterval(604800), completionDate: Date()), // Due in 7 days
        Task(mainInformation: MainInformation(description: "Cook a new recipe 🍲"), isCompleted: false, dueDate: Date().addingTimeInterval(1209600), completionDate: Date()), // Due in 14 days
        Task(mainInformation: MainInformation(description: "Attend a meetup 🤝"), isCompleted: false, dueDate: Date().addingTimeInterval(1814400), completionDate: Date()), // Due in 21 days
        Task(mainInformation: MainInformation(description: "Research for upcoming project 📊"), isCompleted: false, dueDate: Date().addingTimeInterval(12096000), completionDate: Date()), // Due in 14 days
        Task(mainInformation: MainInformation(description: "Write a short story 📝"), isCompleted: false, dueDate: Date().addingTimeInterval(12960000), completionDate: Date()), // Due in 15 days
        Task(mainInformation: MainInformation(description: "Plan a family dinner 🍽️"), isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 15 days (same day as the previous task)
        Task(mainInformation: MainInformation(description: "Study for certification exam 📚"), isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 17 days
        Task(mainInformation: MainInformation(description: "Create a workout routine 💪"), isCompleted: false, dueDate: Date().addingTimeInterval(14688000), completionDate: Date()), // Due in 17 days (same day as the previous task)
        Task(mainInformation: MainInformation(description: "Paint a landscape 🎨"), isCompleted: false, dueDate: Date().addingTimeInterval(16416000), completionDate: Date()), // Due in 19 days
        Task(mainInformation: MainInformation(description: "Visit the museum 🏛️"), isCompleted: false, dueDate: Date().addingTimeInterval(17280000), completionDate: Date()), // Due in 20 days
        Task(mainInformation: MainInformation(description: "Learn a new musical instrument 🎵"), isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 20 days (same day as the previous task)
        Task(mainInformation: MainInformation(description: "Attend a coding bootcamp 👩‍💻"), isCompleted: false, dueDate: Date().addingTimeInterval(19008000), completionDate: Date()), // Due in 22 days
        Task(mainInformation: MainInformation(description: "Practice calligraphy ✒️"), isCompleted: false, dueDate: Date().addingTimeInterval(19008000), completionDate: Date()), // Due in 22 days (same day as the previous task)
        Task(mainInformation: MainInformation(description: "Cook a fancy dinner 🍲"), isCompleted: false, dueDate: Date().addingTimeInterval(20736000), completionDate: Date()), // Due in 24 days
        Task(mainInformation: MainInformation(description: "Explore a new hiking trail 🥾"), isCompleted: false, dueDate: Date().addingTimeInterval(20736000), completionDate: Date()), // Due in 24 days (same day as the previous task)
        Task(mainInformation: MainInformation(description: "Write a poem 📜"), isCompleted: false, dueDate: Date().addingTimeInterval(22464000), completionDate: Date()), // Due in 26 days
        Task(mainInformation: MainInformation(description: "Practice photography 📷"), isCompleted: false, dueDate: Date().addingTimeInterval(23328000), completionDate: Date()), // Due in 27 days
        Task(mainInformation: MainInformation(description: "Learn a dance routine 💃"), isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 27 days (same day as the previous task)
        Task(mainInformation: MainInformation(description: "Visit a new cafe ☕"), isCompleted: false, dueDate: Date().addingTimeInterval(25056000), completionDate: Date()), // Due in 29 days
        Task(mainInformation: MainInformation(description: "Write a journal entry 📓"), isCompleted: false, dueDate: Date().addingTimeInterval(25920000), completionDate: Date()), // Due in 30 days
        Task(mainInformation: MainInformation(description: "Join a language exchange meetup 🌐"), isCompleted: false, dueDate: Date().addingTimeInterval(25920000), completionDate: Date()), // Due in 30 days (same day as the previous task)
        Task(mainInformation: MainInformation(description: "Start a book club 📖"), isCompleted: false, dueDate: Date().addingTimeInterval(26784000), completionDate: Date()), // Due in 31 days
        Task(mainInformation: MainInformation(description: "Create a budget for the month 💰"), isCompleted: false, dueDate: Date().addingTimeInterval(26784000), completionDate: Date()) // Due in 31 days (same day as the previous task)
    ]

}

    
