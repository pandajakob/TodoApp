//
//  TaskData.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 19/11/2023.
//

import Foundation



class TaskData: ObservableObject {

    @Published var tasks: [Task] = []
    @Published var publishedGroupedTasks: [GroupedTask] = []
    


    func updateGroupedTasks() {
        
        var groupedTasks: [GroupedTask] = []
        
        let filteredTasks = tasks.filter({ /*$0.isCompleted == false &&*/ !$0.isDueDateInToday && $0.dueDate > Date()})
        
        let sortedTasks = filteredTasks.sorted(by: {$0.dueDate < $1.dueDate})
        
        for task in sortedTasks {
            
            if let index = groupedTasks.firstIndex(where: { $0.date == task.formattedDueDate
            }) {
                groupedTasks[index].tasks.append(task)
            } else {
                groupedTasks.append(GroupedTask(date: task.formattedDueDate, tasks: [task]))
            }
        }
        
        publishedGroupedTasks = groupedTasks
        
        
    }
    
    
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
    
    func removeAllTasks() {
        tasks.removeAll()
    }
    func removeAllRepeated(task: Task) {
        var deleteIndex: [Int] = []
        for num in tasks.indices {
            if tasks[num].description == task.description {
                deleteIndex.append(num)
            }
        }
        guard deleteIndex.isEmpty else { return }
        
        for index in deleteIndex {
            tasks.remove(at: index)
        }
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
    }
    
 
}
