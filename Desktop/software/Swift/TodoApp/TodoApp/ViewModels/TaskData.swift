//
//  TaskData.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 19/11/2023.
//

import Foundation

struct GroupedTask: Identifiable {
    var id = UUID()
    var date: String
    var tasks: [Task]
    
}

class TaskData: ObservableObject {
    @Published var tasks = Task.tasks
    
    func isDateInToday(date: Date) -> Bool {
        Calendar.current.isDateInToday(date)
    }
    
    func findIndex(task: Task) -> Int {
        for index in 0...(tasks.count-1) {
            if (Calendar.current.isDate(tasks[index].dueDate, inSameDayAs: task.dueDate)) && tasks[index].description == task.description {
                return index
            }
        }
        return 0
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
