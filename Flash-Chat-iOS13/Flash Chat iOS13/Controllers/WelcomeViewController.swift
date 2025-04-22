//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func updateLabel() {
        titleLabel.text = Constants.appTitle
//        let text = titleLabel.text // "⚡️FlashChat"
//        titleLabel.text = ""
//        var charCount = 0.0
//        for char in text! {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charCount, repeats: false)
//            { _ in
//                self.titleLabel.text?.append(String(char))
//            }
//            charCount += 1.0
//        }
    }
}
