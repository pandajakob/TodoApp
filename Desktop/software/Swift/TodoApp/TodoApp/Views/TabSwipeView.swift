//
//  SwiftUIView.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 20/11/2023.
//

import SwiftUI

struct TabSwipeView: View {
    @State private var picker = "Today"
    @StateObject private var taskData = TaskData()

    @State private var newTask = Task()
    var body: some View {
        
        NavigationStack {
            VStack {
                Picker("", selection: $picker) {
                    Text("Today")
                        .foregroundStyle(.white)
                        .tag("Today")
                    Text("Upcomming")
                        .foregroundStyle(.white)
                        .tag("Upcomming")
                    Text("Completed")
                        .foregroundStyle(.white)
                        .tag("Completed")
                }.pickerStyle(.segmented)
                    .padding()
                
                
                TabView(selection: $picker) {
                    UndoneView()
                        .tabItem { Image(systemName: "sun.min")  }.tag("Today")
                    UpcommingView()
                        .tabItem { Image(systemName: "arrow.up") }.tag("Upcomming")
                        .environmentObject(taskData)
                    CompletedView()
                        .tabItem { Image(systemName: "checkmark") }.tag("Completed")
                    
                }
                .padding(.bottom)
                .tabViewStyle(.page)
                    .navigationTitle(picker)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink {
                                ModifyTaskView(task: $newTask)
                                    .navigationTitle("New Task")
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                            }
                        }
                    }
            }                       .ignoresSafeArea(edges: .bottom)

                .navigationBarTitleDisplayMode(.large)
                .background(AppColor.background)
                
                
            
        }

    }
}

#Preview {
    TabSwipeView()
}
