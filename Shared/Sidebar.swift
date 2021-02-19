//
//  Sidebar.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-17.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        #if os(iOS)
        content
            .navigationTitle("Learn")
        #else
        content
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
        #endif
    }
    
    var content: some View {
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Livestreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
        }
        .listStyle(SidebarListStyle())
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
