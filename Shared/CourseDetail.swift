//
//  CourseDetail.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-22.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course
    var namespace: Namespace.ID
    var close: () -> Void = {}
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var cornerRadius: CGFloat = 22
    var courseItemHeight: CGFloat {
        return horizontalSizeClass == .compact ? 300 : 400
    }
    var paddingTop: CGFloat {
        return horizontalSizeClass == .compact ? 32 : 16
    }
    #else
    var cornerRadius: CGFloat = 0
    let courseItemHeight: CGFloat = 400
    let paddingTop = 16
    #endif
    
    var content: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: courseItemHeight)
                
                VStack {
                    ForEach(courseSections) { section in
                        CourseRow(section: section)
                        Divider()
                    }
                }
                .padding(.horizontal)
            }
            
            CloseButton(action: close)
                .buttonStyle(PlainButtonStyle())
                .padding()
                .padding(.top, paddingTop)
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
    
    var body: some View {
        #if os(iOS)
        content
            .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetail(course: courses[0], namespace: namespace)
    }
}
