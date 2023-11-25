//
//  ModifyTaskView.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 20/11/2023.
//

import SwiftUI

struct ModifyTaskView: View {
    @State private var description = ""
    @State private var repeatTask = false
    
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
                    
                    Toggle(isOn: $repeatTask) {
                        Text("Repeat")
                            .font(.headline)
                    }
                    
                    if repeatTask {
                        Section("Repeat Task") {
                            
                            
                            
                        }
                        
                        
                    }
                        
                }                 .scrollContentBackground(.hidden)
                    .background(AppColor.secondaryBG)

                

            }
        }
    }
}

