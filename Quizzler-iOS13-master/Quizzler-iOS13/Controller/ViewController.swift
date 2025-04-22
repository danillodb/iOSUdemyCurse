//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textQuestion: UILabel!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var labelScore: UILabel!
    
    var quizBiz = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showQuestion()
    }

    @IBAction func answerButtonClick(_ sender: UIButton) {
        let answer = sender.currentTitle!
        if quizBiz.checkAnswer(answer) {
            print("Correct!")
            sender.backgroundColor = UIColor.green
            quizBiz.increaseScore()
        } else {
            print("Incorrect!")
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(showQuestion), userInfo: nil, repeats: false)
    }
    
    @objc private func showQuestion() {
        self.textQuestion.text = quizBiz.getQuestionText()
        self.progressBar.progress = quizBiz.getCurrentProgress()
        self.labelScore.text = "Score: \(quizBiz.getScore())"
        
        quizBiz.nextQuestion()
        
        self.buttonTrue.backgroundColor = UIColor.clear
        self.buttonFalse.backgroundColor = UIColor.clear
    }
}

