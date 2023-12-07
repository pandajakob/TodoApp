//
//  SwiftUIView.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 20/11/2023.
//

import SwiftUI

enum viewEnum: String, CaseIterable {
    case Tasks, Completed
}
struct TabSwipeView: View {
    @State private var picker = viewEnum.Tasks
    @StateObject private var taskData = TaskData()
    @State private var newTask = Task()
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Today", selection: $picker) {
                    ForEach(viewEnum.allCases, id: \.self) { view in
                        Text(view.rawValue)
                            .foregroundStyle(.white)
                            .tag(view)
                    }
                    
                }.pickerStyle(.segmented)
                    .padding()
                
                
                TabView(selection: $picker,
                        content:  {
                    CommingView()
                        .tabItem { Image(systemName: "calendar")  }.tag(viewEnum.Tasks)
                        .environmentObject(taskData)
                   
                    CompletedView()
                        .tabItem { Image(systemName: "checkmark")  }.tag(viewEnum.Completed)
                        .environmentObject(taskData)

                })
                .padding(.bottom)
                .tabViewStyle(.page)
                .navigationTitle(picker.rawValue)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            
                            NavigationLink {
                                ModifyTaskView(task: $newTask)
                                    .navigationTitle("New Task")
                                    .environmentObject(taskData)

                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                            }                                  

                        }
                    }
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationBarTitleDisplayMode(.large)
            .background(AppColor.background)
            .onAppear {
                newTask = Task.init()
                try! taskData.load()
            }
            .onChange(of: taskData.tasks) { _ in
                try! taskData.save()
            }
                
                
            
        }

    }
    
}

#Preview {
    TabSwipeView()
}
