//
//  ContentView.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 19/11/2023.
//

import SwiftUI

struct TasksView: View {
    @StateObject private var taskData = TaskData()
    @State private var text = "Today"
    @State private var isPresented = false
    
    @State private var taskToEdit = Task.tasks[0]
    
    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationStack {
            VStack {
            
                
                Divider().foregroundStyle(.black)
                    .padding(.top, -10)
                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        ButtonView(task: $taskData.tasks[index])
                            .padding(.vertical, -5)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    taskData.tasks.remove(at: index)
                                } label: {
                                    Image(systemName: "trash.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(AppColor.primary, AppColor.secondary)
                                    
                                }
                                .tint(.red.opacity(0.0))
                                
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button {
                                    taskToEdit = taskData.tasks[index]
                                    isPresented.toggle()
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(AppColor.primary, AppColor.secondary)
                                    
                                    
                                }
                                .tint(.red.opacity(0.0))
                                
                            }
                        
                        
                    }.sheet(isPresented: $isPresented , content: {
                        ModifyTaskView(task: $taskToEdit)
                            .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button{
                                  dismiss()
                                } label: {
                                 Text("dismiss")
                                }
                            }
                            ToolbarItem {
                                Button{
                                    
                                } label: {
                                 Text("save")
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                    })
                    
                    .listRowSeparator(.hidden)
                    .listRowBackground(AppColor.background)
                }
                .listStyle(.plain)
            }
                .background(AppColor.background)
                    
            }
    }
    
}

extension TasksView {
    private var tasks: [Task] {
        taskData.tasks
    }
    
}


struct ButtonView: View {
    @Binding var task: Task
    var color: Color {
        task.isCompleted ? Color.black.opacity(0.2) : AppColor.secondaryBG
    }
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 65)
                .foregroundStyle(color)
            HStack {
                Text(task.mainInformation.description)
                    .font(.headline)
                    .foregroundStyle(AppColor.primary, AppColor.secondary)                    .strikethrough(task.isCompleted)
                Spacer()
                Image(systemName: task.isCompleted ? "checkmark" : "circle")
                .foregroundStyle(AppColor.primary, AppColor.secondary)            }.padding(.horizontal)
        }.onTapGesture {
            withAnimation {
                task.completed()
            }
        }
    }
}
#Preview {
    TasksView()
}
