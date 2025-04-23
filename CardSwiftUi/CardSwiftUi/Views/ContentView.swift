//
//  ContentView.swift
//  CardSwiftUi
//
//  Created by Danillo Diniz Barbosa on 22/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.53)
                .ignoresSafeArea(edges: .all)
            VStack {
                Image("danillo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(.circle)
                    .overlay(Circle()
                        .stroke(style: StrokeStyle(lineWidth: 4))
                        .foregroundColor(.white))
                Text("Danillo D. Barbosa")
                    .font(Font.custom("PlaywriteAUSA-Regular", size: 26))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                Divider()
                ViewButton(imageName: "phone.fill", text: "+55 34 9990-9889")
                ViewButton(imageName: "envelope.fill", text: "danillodiniz@gmail.com")
            }
        }
    }
}

#Preview {
    ContentView()
}


