//
//  BmiModel.swift
//  BMI Calculator
//
//  Created by Danillo Diniz Barbosa on 11/04/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct BmiModel {
    var heightValue: Float = 0
    var weightValue: Float = 0
    var bmiValue: Float?
    var advice: String?
    var color: UIColor?
    
    mutating func calculateBmi()  {
        bmiValue = weightValue / pow(heightValue, 2)
        if let value = bmiValue {
            if value < 18.5 {
                advice = "Underweight"
                color = .yellow
            } else if value < 25 {
                advice = "Normal weight"
                color = .green
            } else {
                advice = "Overweight"
                color = .red
            }
        }
    }
    
    func getBmiValue() -> String {
        return String(format: "%.2f", bmiValue ?? 0.0)
    }
    
    func getAdvice() -> String? {
        return advice
    }
    
    func getColor() -> UIColor? {
        return color
    }
}
