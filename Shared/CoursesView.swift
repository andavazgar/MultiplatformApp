//
//  CoursesView.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-17.
//

import SwiftUI

struct CoursesView: View {
    @State private var selectedCourse: Course?
    @State private var isDisabled = false
    @Namespace private var animation
    
    var coursesGrid: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 16)], spacing: 16) {
                ForEach(courses) { course in
                    VStack {
                        CourseItem(course: course)
                            .matchedGeometryEffect(id: course.id, in: animation)
                            .frame(height: 200)
                            .onTapGesture {
                                toggleCourseView(course: course)
                            }
                            .disabled(isDisabled)
                    }
                    .matchedGeometryEffect(id: "container\(course.id)", in: animation)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
    
    var body: some View {
        ZStack {
            #if os(iOS)
                coursesGrid
                    .navigationBarHidden(true)
            #else
                coursesGrid
            #endif
            
            if let selectedCourse = selectedCourse {
                CourseDetail(course: selectedCourse, namespace: animation) {
                    toggleCourseView(course: nil)
                }
                .zIndex(1)
                .frame(maxWidth: 720)
                .frame(maxWidth: .infinity)
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            }
        }
        .navigationTitle("Courses")
    }
    
    func toggleCourseView(course: Course?) {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
            selectedCourse = course
        }
        
        if course != nil {
            isDisabled = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isDisabled = false
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
