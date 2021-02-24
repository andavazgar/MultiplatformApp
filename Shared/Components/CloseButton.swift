//
//  CloseButton.swift
//  MultiplatformApp
//
//  Created by Andres Vazquez on 2021-02-22.
//

import SwiftUI

struct CloseButton: View {
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(Font.headline.bold())
                .foregroundColor(.white)
                .padding(10)
                .background(Color.black.opacity(0.6))
                .clipShape(Circle())
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
            .previewLayout(.sizeThatFits)
    }
}
