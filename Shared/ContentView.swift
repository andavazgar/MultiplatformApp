//
//  ContentView.swift
//  Shared
//
//  Created by Andres Vazquez on 2021-02-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image("Illustration 1")
                .resizable()
                .scaledToFit()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
