//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Danillo Diniz Barbosa on 15/04/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//
struct Constants {
    static let appTitle = "⚡️FlashChat"
    static let segueRegisterToChat = "RegisterToChat"
    static let segueLoginToChat = "LoginToChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
