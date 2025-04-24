//
//  WebView.swift
//  H4XOR News
//
//  Created by Danillo Diniz Barbosa on 24/04/25.
//
import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: String?
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = url {
            if let safeURL = URL(string: safeString) {
                uiView.load(URLRequest(url: safeURL))
            }
        }
    }
}
