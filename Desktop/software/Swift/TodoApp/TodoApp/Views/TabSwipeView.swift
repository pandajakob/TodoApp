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
                    TodayView()
                        .tabItem { Image(systemName: "sun.min")  }.tag("Today")
                    UpcommingView()
                        .tabItem { Image(systemName: "arrow.up") }.tag("Upcomming")
                        .environmentObject(taskData)
                    CompletedView()
                        .tabItem { Image(systemName: "checkmark") }.tag("Completed")
                    
                }.tabViewStyle(.page)
                    .navigationTitle(picker)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                                
                            }
                        }
                    }
            }
                .navigationBarTitleDisplayMode(.large)
                .background(AppColor.background)
                
                
            
        }
    }
}

#Preview {
    TabSwipeView()
}
