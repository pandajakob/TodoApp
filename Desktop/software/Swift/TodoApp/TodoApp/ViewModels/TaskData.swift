//
//  TaskData.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 19/11/2023.
//

import Foundation



class TaskData: ObservableObject {

    @Published var tasks: [Task] = []
    @Published var groupedTasks: [GroupedTask] = []
    

    func updateGroupedTasks() {
        
        var _groupedTasks: [GroupedTask] = []
        
        let filteredTasks = tasks.filter({ /*$0.isCompleted == false &&*/  $0.dueDate >= Calendar.current.startOfDay(for: Date()) })
        
        let sortedTasks = filteredTasks.sorted(by: {$0.dueDate < $1.dueDate})
        
        for task in sortedTasks {
            
            if let index = _groupedTasks.firstIndex(where: { $0.date == task.formattedDueDate
            }) {
                _groupedTasks[index].tasks.append(task)
            } else {
                _groupedTasks.append(GroupedTask(date: task.formattedDueDate, tasks: [task]))
            }
        }
        
        groupedTasks = _groupedTasks
        
        
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
    
    func removeAllTasks() {
        tasks.removeAll()

    }
    func removeAllRepeated(task: Task) {
        
        tasks.removeAll(where: {$0.description == task.description})
    }
    
    private var taskFileURL: URL {
        do {
            
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory
        }
        catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
    
    private var tasksFile: URL {
            return taskFileURL
                .appendingPathComponent("tasks", conformingTo: .json)

    }
//    FileManager.default.isReadableFile(atPath: tasksFile.path) else
    func load() throws {
        guard let data = try? Data(contentsOf: tasksFile) else { return }
        
        do {
            let savedTasks = try JSONDecoder().decode([Task].self, from: data)
            tasks = savedTasks
        }
        catch {
              fatalError("An error occurred while loading recipes: \(error)")
            }
        
    }
    
    func save() throws {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: tasksFile)
        } catch {
            fatalError("An error occurred while saving recipes: \(error)")
        }
        updateGroupedTasks()

    }
    
 
}
