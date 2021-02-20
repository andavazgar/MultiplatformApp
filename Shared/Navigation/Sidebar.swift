//
//  Sidebar.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-17.
//

import SwiftUI

struct Sidebar: View {
    
    enum NavigationItem {
        case courses, tutorials, livestreams, certificates, search
    }
    
    @State private var selection: NavigationItem? = .courses
    
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: CoursesView(), tag: NavigationItem.courses, selection: $selection) {
                Label("Courses", systemImage: "book.closed")
            }
            
            NavigationLink(destination: Text("Tutorials"), tag: NavigationItem.tutorials, selection: $selection) {
                Label("Tutorials", systemImage: "list.bullet.rectangle")
            }
            
            NavigationLink(destination: Text("Livestreams"), tag: NavigationItem.livestreams, selection: $selection) {
                Label("Livestreams", systemImage: "tv")
            }
            
            NavigationLink(destination: Text("Certificates"), tag: NavigationItem.certificates, selection: $selection) {
                Label("Certificates", systemImage: "mail.stack")
            }
            
            NavigationLink(destination: Text("Search"), tag: NavigationItem.search, selection: $selection) {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    var body: some View {
        NavigationView {
            #if os(iOS)
            sidebar
                .navigationTitle("Learn")
                .toolbar {
                    ToolbarItem {
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                        }
                    }
                }
            #else
            sidebar
                .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
                .toolbar {
                    ToolbarItem {
                        Button(action: toggleSidebar) {
                            Image(systemName: "sidebar.left")
                        }
                    }
                }
            #endif
        }
    }
    
    func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
