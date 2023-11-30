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

    @Published var tasks: [Task] = []
    
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
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    func removeTask(at index: Int) {
        
        tasks.remove(at: index)
    }
    
    
    private var documentDirectory: URL {
        try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private var tasksFile: URL {
      return documentDirectory
            .appendingPathComponent("tasks", conformingTo: .json)

    }
    
    func load() throws {
        guard FileManager.default.isReadableFile(atPath: tasksFile.path) else { return }
        let data = try Data(contentsOf: tasksFile)
        tasks = try JSONDecoder().decode([Task].self, from: data)
    }
    
    func save() throws {
        let data = try JSONEncoder().encode(tasks)
        try data.write(to: tasksFile)
    }
    
 
}
