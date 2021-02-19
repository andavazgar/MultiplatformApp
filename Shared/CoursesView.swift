//
//  CoursesView.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-17.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var content: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
