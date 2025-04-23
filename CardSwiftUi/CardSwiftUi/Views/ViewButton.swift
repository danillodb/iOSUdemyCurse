//
//  ViewButton.swift
//  CardSwiftUi
//
//  Created by Danillo Diniz Barbosa on 23/04/25.
//

import SwiftUI

struct ViewButton: View {
    var imageName: String
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.black)
                    Text(text).foregroundColor(.black)
                }
            )
            .padding(.all, 10)
    }
}

#Preview {
    ViewButton(imageName: "paperplane.fill", text: "Send")
}
