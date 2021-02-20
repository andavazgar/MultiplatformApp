//
//  CourseList.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-19.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 700, minHeight: 600)
        #endif
    }
    
    var content: some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
