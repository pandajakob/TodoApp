//
//  ModifyTaskView.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 20/11/2023.
//

import SwiftUI

struct ModifyTaskView: View {
    @EnvironmentObject var taskData: TaskData
    @Environment(\.dismiss) var dismiss
    @Binding var task: Task
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section("Description") {
                        TextField("E.g. Go for a run 🏃‍♀️", text: $task.description)
                            .font(.headline)
                    }
                    Section("Date") {
                        DatePicker("Due to", selection: $task.dueDate, displayedComponents: .date)
                    }
                    
                    Section(header: Text("Repeat task")) {
                                 Picker("Repeat task", selection: $task.repeatTask) {
                                     ForEach(RepeatOptions.allCases, id: \.self) { repeatTask in
                                         Text(repeatTask.rawValue).tag(repeatTask)
                                     }
                                 }
                             }

                        
                }   .scrollContentBackground(.hidden)
                    .background(AppColor.secondaryBG)

                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            dismiss()
                            for date in findRepeatDates(date: task.dueDate, repeated: task.repeatTask) {
                                task.dueDate = date
                                task.completionDate = date
                                taskData.addTask(task: task)

                            }
                        } label: {
                           Rectangle()
                                .clipShape(.capsule)
                                .foregroundStyle(AppColor.background)
                                .frame(width: 110, height: 53)
                                .padding(25)
                                .shadow(radius: 3, x: 3, y: 3)
                                .overlay {
                                    Image(systemName: "plus").foregroundStyle(.white)
                                }
                        }
                    }
                    
                }
            }
        }
    }
}
extension ModifyTaskView {
    
    func findRepeatDates(date: Date, repeated: RepeatOptions) -> [Date] {
        var dates = [date]
        
        switch repeated {
        case .never:
            return dates
        case .daily:
            for num in 1...31 {
                var dateComponents = DateComponents(era: 0, year: 0, month: 0, day: 3, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: 0, weekOfMonth: 0, yearForWeekOfYear: 0)
                dateComponents.day = num
               
                dates.append(Calendar.current.date(byAdding: dateComponents, to: date) ?? Date())
            }
        case .weekly:
            for num in 1...4 {
                var dateComponents = DateComponents(era: 0, year: 0, month: 0, day: 3, hour: 0, minute: 0, second: 0, nanosecond: 0, weekday: 0, weekOfMonth: 0, yearForWeekOfYear: 0)

                dateComponents.day = num*7
                dates.append(Calendar.current.date(byAdding: dateComponents, to: date) ?? Date())
            }
        case .twoweekly:
            for num in 1...4 {
                var dateComponents = DateComponents()
                dateComponents.day = num*14
                dates.append(Calendar.current.date(byAdding: dateComponents, to: date) ?? Date())
            }
        case .montly:
            for num in 1...3 {
                var dateComponents = DateComponents()
                dateComponents.month = num
                dates.append(Calendar.current.date(byAdding: dateComponents, to: date) ?? Date())
            }
        case .yearly:
            for num in 1...3 {
                var dateComponents = DateComponents()
                dateComponents.year = num
                dates.append(Calendar.current.date(byAdding: dateComponents, to: date) ?? Date())
            }
        }
        return dates
    }
}
