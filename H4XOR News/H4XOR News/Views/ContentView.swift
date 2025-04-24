//
//  ContentView.swift
//  H4XOR News
//
//  Created by Danillo Diniz Barbosa on 23/04/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    let title: String = "H4XOR News"

    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle(title)
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
