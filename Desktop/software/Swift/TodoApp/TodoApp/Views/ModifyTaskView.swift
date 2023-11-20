//
//  ModifyTaskView.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 20/11/2023.
//

import SwiftUI

struct ModifyTaskView: View {
    @State private var description = ""
    @Binding var task: Task
    var body: some View {
            ZStack {
                AppColor.background.ignoresSafeArea()
                
                Form {
                    TextField("Task description", text: $task.mainInformation.description)
                }
            }
    }
}

