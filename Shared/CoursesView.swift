//
//  CoursesView.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-17.
//

import SwiftUI

struct CoursesView: View {
    @State private var showCourseDetails = false
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            CourseItem()
                .matchedGeometryEffect(id: "Card", in: animation)
                .frame(width: 335, height: 250)
            
            if showCourseDetails {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: animation)
                    
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding(.horizontal)
                    .background(Color("Background 1"))
                }
                .transition(.asymmetric(insertion: animate(withDelay: 0.3), removal: animate(withDelay: 0)))
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                showCourseDetails.toggle()
            }
        }
    }
    
    func animate(withDelay delay: Double) -> AnyTransition {
        AnyTransition.opacity.animation(Animation.spring().delay(delay))
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
