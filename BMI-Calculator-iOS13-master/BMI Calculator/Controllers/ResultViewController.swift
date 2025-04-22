//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Danillo Diniz Barbosa on 11/04/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var labelAdvice: UILabel!
    @IBOutlet weak var labelBmi: UILabel!
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelBmi.text = bmiValue
        labelAdvice.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculateButtonClick(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
