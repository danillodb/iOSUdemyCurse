//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Danillo Diniz Barbosa on 10/04/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct Question {
    let text: String
    let answers: String
    
    init(q: String, a: String) {
        self.text = q
        self.answers = a
    }
}
