//
//  MultiplatformAppApp.swift
//  Shared
//
//  Created by Andres Vazquez on 2021-02-16.
//

import SwiftUI

@main
struct MultiplatformAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Sidebar()
                CoursesView()                
            }
        }
        .commands {
            SidebarCommands()
        }
    }
}
