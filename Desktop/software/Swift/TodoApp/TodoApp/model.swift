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
    
    var description: String
    
    var isCompleted: Bool
    
    var dueDate: Date
    
    var completionDate: Date = Date()
    
    var isDueDateInToday: Bool {
        Calendar.current.isDateInToday(dueDate)
    }
    
    var formattedDueDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: dueDate)
    }
    
    init() {
        self.init(description: "", isCompleted: false, dueDate: Date.now, completionDate: Date.now)
    }
    
    init(id: UUID = UUID(), description: String, isCompleted: Bool, dueDate: Date, completionDate: Date) {
        self.id = id
        self.description = description
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.completionDate = completionDate
    }
    
    mutating func taskCompleted() {
        completionDate = Date()
        isCompleted.toggle()
    }
    


}





extension Task {
    static var tasks: [Task] = [
            Task(description: "Complete homework 📚", isCompleted: false, dueDate: Date().addingTimeInterval(86400), completionDate: Date()), // Due tomorrow
            Task(description: "Read a book 📖", isCompleted: true, dueDate: Date().addingTimeInterval(172800), completionDate: Date()), // Due in 2 days
            Task(description: "Go for a run 🏃‍♂️", isCompleted: false, dueDate: Date().addingTimeInterval(259200), completionDate: Date()), // Due in 3 days
            Task(description: "Write a blog post ✍️", isCompleted: true, dueDate: Date().addingTimeInterval(432000), completionDate: Date()), // Due in 5 days
            Task(description: "Learn a new programming language 💻", isCompleted: false, dueDate: Date().addingTimeInterval(604800), completionDate: Date()), // Due in 7 days
            Task(description: "Cook a new recipe 🍲", isCompleted: false, dueDate: Date().addingTimeInterval(1209600), completionDate: Date()), // Due in 14 days
            Task(description: "Attend a meetup 🤝", isCompleted: false, dueDate: Date().addingTimeInterval(1814400), completionDate: Date()), // Due in 21 days
            Task(description: "Research for upcoming project 📊", isCompleted: false, dueDate: Date().addingTimeInterval(12096000), completionDate: Date()), // Due in 14 days
            Task(description: "Write a short story 📝", isCompleted: false, dueDate: Date().addingTimeInterval(12960000), completionDate: Date()), // Due in 15 days
            Task(description: "Plan a family dinner 🍽️", isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 15 days (same day as the previous task)
            Task(description: "Study for certification exam 📚", isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 17 days
            Task(description: "Create a workout routine 💪", isCompleted: false, dueDate: Date().addingTimeInterval(14688000), completionDate: Date()), // Due in 17 days (same day as the previous task)
            Task(description: "Paint a landscape 🎨", isCompleted: false, dueDate: Date().addingTimeInterval(16416000), completionDate: Date()), // Due in 19 days
            Task(description: "Visit the museum 🏛️", isCompleted: false, dueDate: Date().addingTimeInterval(17280000), completionDate: Date()), // Due in 20 days
            Task(description: "Learn a new musical instrument 🎵", isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 20 days (same day as the previous task)
            Task(description: "Attend a coding bootcamp 👩‍💻", isCompleted: false, dueDate: Date().addingTimeInterval(19008000), completionDate: Date()), // Due in 22 days
            Task(description: "Practice calligraphy ✒️", isCompleted: false, dueDate: Date().addingTimeInterval(19008000), completionDate: Date()), // Due in 22 days (same day as the previous task)
            Task(description: "Cook a fancy dinner 🍲", isCompleted: false, dueDate: Date().addingTimeInterval(20736000), completionDate: Date()), // Due in 24 days
            Task(description: "Explore a new hiking trail 🥾", isCompleted: false, dueDate: Date().addingTimeInterval(20736000), completionDate: Date()), // Due in 24 days (same day as the previous task)
            Task(description: "Write a poem 📜", isCompleted: false, dueDate: Date().addingTimeInterval(22464000), completionDate: Date()), // Due in 26 days
            Task(description: "Practice photography 📷", isCompleted: false, dueDate: Date().addingTimeInterval(23328000), completionDate: Date()), // Due in 27 days
            Task(description: "Learn a dance routine 💃", isCompleted: false, dueDate: Date(), completionDate: Date()), // Due in 27 days (same day as the previous task)
            Task(description: "Visit a new cafe ☕", isCompleted: false, dueDate: Date().addingTimeInterval(25056000), completionDate: Date()), // Due in 29 days
            Task(description: "Write a journal entry 📓", isCompleted: false, dueDate: Date().addingTimeInterval(25920000), completionDate: Date()), // Due in 30 days
            Task(description: "Join a language exchange meetup 🌐", isCompleted: false, dueDate: Date().addingTimeInterval(25920000), completionDate: Date()), // Due in 30 days (same day as the previous task)
            Task(description: "Start a book club 📖", isCompleted: false, dueDate: Date().addingTimeInterval(26784000), completionDate: Date()), // Due in 31 days
            Task(description: "Create a budget for the month 💰", isCompleted: false, dueDate: Date().addingTimeInterval(26784000), completionDate: Date()) // Due in 31 days (same day as the previous task)
        ]
        
}

    
