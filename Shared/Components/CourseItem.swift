//
//  CourseItem.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-19.
//

import SwiftUI

struct CourseItem: View {
    var course: Course
    
    #if os(iOS)
    var cornerRadius: CGFloat = 22
    #else
    var cornerRadius: CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(course.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            
            Text(course.title)
                .fontWeight(.bold)
            Text(course.subtitle)
                .font(.footnote)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .foregroundColor(.white)
        .background(course.color)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem(course: courses[0])
            .previewLayout(.sizeThatFits)
    }
}
