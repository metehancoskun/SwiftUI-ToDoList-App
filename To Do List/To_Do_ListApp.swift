//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Metehan on 29.11.2025.
//

import SwiftUI

@main
struct To_Do_ListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
