//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgDiceOne: UIImageView!
    @IBOutlet weak var imgDiceTwo: UIImageView!
    @IBOutlet weak var btnRollDice: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgDiceOne.image = #imageLiteral(resourceName: "Dice1")
        imgDiceTwo.image = #imageLiteral(resourceName: "Dice2")
    }


    @IBAction func btnRollDiceClicked(_ sender: Any) {
        rollDiceByNumber(dice: imgDiceOne)
        rollDiceByArray(dice: imgDiceTwo)
    }
    
    func rollDiceByNumber(dice: UIImageView!) {
        let randomNumber = getRandomNumber()
        dice.image = #imageLiteral(resourceName: "Dice\(randomNumber)")
    }
    
    func getRandomNumber() -> Int {
        return Int.random(in: 1...6)
    }
    
    func rollDiceByArray(dice: UIImageView!) {
        let diceArray = [#imageLiteral(resourceName: "Dice1"), #imageLiteral(resourceName: "Dice2"), #imageLiteral(resourceName: "Dice3"), #imageLiteral(resourceName: "Dice4"), #imageLiteral(resourceName: "Dice5"), #imageLiteral(resourceName: "Dice6")]
        dice.image = diceArray.randomElement()
    }
}

