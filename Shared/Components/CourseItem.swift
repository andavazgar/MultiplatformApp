//
//  CourseItem.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-19.
//

import SwiftUI

struct CourseItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Spacer()
                Image("Illustration 1")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            Text("SwiftUI for iOS 14")
                .fontWeight(.bold)
            Text("20 Sections")
                .font(.footnote)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
            .previewLayout(.sizeThatFits)
    }
}
