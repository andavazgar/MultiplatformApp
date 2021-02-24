//
//  CourseRow.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-17.
//

import SwiftUI

struct CourseRow: View {
    var section: CourseSection
    
    var body: some View {
        HStack(alignment: .top) {
            Image(section.logo)
                .frame(width: 48, height: 48)
                .background(section.color)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(section.title)
                    .font(.subheadline)
                    .bold()
                Text(section.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow(section: courseSections[0])
            .previewLayout(.sizeThatFits)
    }
}
