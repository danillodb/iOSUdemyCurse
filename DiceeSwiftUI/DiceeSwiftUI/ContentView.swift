//
//  ContentView.swift
//  DiceeSwiftUI
//
//  Created by Danillo Diniz Barbosa on 23/04/25.
//

import SwiftUI

struct ContentView: View {
    let numbers = (1...6)
    @State var lDiceNumber: Int = 1
    @State var rDiceNumber: Int = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                
                Spacer()
                
                HStack {
                    DiceView(diceNumber: lDiceNumber)
                    DiceView(diceNumber: rDiceNumber)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    lDiceNumber = Int.random(in: numbers)
                    rDiceNumber = Int.random(in: numbers)
                }) {
                    Text("ROLL")
                        .font(.system(size: 35))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DiceView: View {
    var diceNumber: Int
    var body: some View {
        Image("dice\(diceNumber)")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
