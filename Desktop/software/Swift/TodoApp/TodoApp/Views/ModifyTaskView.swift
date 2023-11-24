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
            ZStack {
                AppColor.background.ignoresSafeArea()
                
                Form {
                    Section("Description") {
                        TextField("E.g. Go for a run 🏃‍♀️", text: $task.mainInformation.description)
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
                    
                }
            }
    }
}

