//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Stefano Casafranca Laos on 11/6/24.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
}

