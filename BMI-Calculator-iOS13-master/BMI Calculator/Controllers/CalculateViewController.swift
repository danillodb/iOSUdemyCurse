//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var sliderHeight: UISlider!
    @IBOutlet weak var sliderWeight: UISlider!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    var bmiModel = BmiModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderHeightChange(_ sender: UISlider) {
        labelHeight.text = "\(String(format: "%.2f", sender.value))m"
    }
    @IBAction func sliderWeightChange(_ sender: UISlider) {
        labelWeight.text = "\(Int(sender.value))kg"
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        bmiModel.heightValue = sliderHeight.value
        bmiModel.weightValue = sliderWeight.value
        bmiModel.calculateBmi()
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiModel.getBmiValue()
            destinationVC.advice = bmiModel.getAdvice()
            destinationVC.color = bmiModel.getColor()
        }
    }
}

