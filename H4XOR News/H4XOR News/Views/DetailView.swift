//
//  DetailView.swift
//  H4XOR News
//
//  Created by Danillo Diniz Barbosa on 24/04/25.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(url: url)
    }
}

#Preview {
    DetailView(url: "https://google.com")
}
