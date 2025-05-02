//
//  ContentView.swift
//  I am Rich
//
//  Created by Danillo Diniz Barbosa on 22/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea(edges: .all)
            VStack {
                Text("I am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image("diamond")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
