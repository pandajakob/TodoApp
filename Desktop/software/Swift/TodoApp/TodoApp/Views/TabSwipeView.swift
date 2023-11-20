//
//  SwiftUIView.swift
//  ListStyleProject
//
//  Created by Jakob Michaelsen on 20/11/2023.
//

import SwiftUI

struct TabSwipeView: View {
    @State private var picker = 0
    var body: some View {
        
        NavigationStack {
            VStack {
                Picker("", selection: $picker) {
                    Text("Today")
                        .foregroundStyle(.white)
                        .tag(0)
                    Text("Upcomming")
                        .foregroundStyle(.white)
                        .tag(1)
                    Text("Completed")
                        .foregroundStyle(.white)
                        .tag(2)
                }.pickerStyle(.segmented)
                    .padding()
                
                
                TabView(selection: $picker) {
                    TasksView()
                        .tabItem { Image(systemName: "sun.min")  }.tag(0)
                        .navigationTitle("Today")
                    TasksView()
                        .tabItem { Image(systemName: "arrow.up") }.tag(1)
                        .navigationTitle("Upcomming")
                    
                    TasksView()
                        .tabItem { Image(systemName: "checkmark") }.tag(2)
                        .navigationTitle("Completed")
                    
                }.tabViewStyle(.page)
            }
                .navigationBarTitleDisplayMode(.large)
                .background(AppColor.background)
                
            
        }
    }
}

#Preview {
    TabSwipeView()
}
