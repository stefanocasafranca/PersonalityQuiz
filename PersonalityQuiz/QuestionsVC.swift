//
//  QuestionsVC.swift
//  PersonalityQuiz
//
//  Created by Stefano Casafranca Laos on 11/6/24.
//

import UIKit

class QuestionsVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!

    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    
    
    
    //Properties
    var questionIndex = 0
    var chosenAnswers: [Answer] = []
    
    var questions: [Question] = [
        Question (text: "Which food do you like most?", type: .single, answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Corn", type: .turtle),
            Answer(text: "Carrots", type: .rabbit)
        ]),
        Question (text: "Which activities do you enjoy", type: .multiple, answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
        ]),
        Question (text: "How much do you enjoy car rides?", type: .ranged, answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
        ])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions [questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        questionLabel.text = currentQuestion.text
        progressView.setProgress (totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack (using: currentAnswers)
            
        case .multiple:
            updateMultipleStack (using: currentAnswers)
            
        case .ranged:
            updateRangedStack (using: currentAnswers)
        }
    }
    
    func updateSingleStack (using answers: [Answer]) {
    singleStackView.isHidden = false
    singleButton1.setTitle(answers [0].text, for: .normal)
    singleButton2.setTitle(answers[1].text, for: .normal)
    singleButton3.setTitle(answers[2].text, for: .normal)
    singleButton4.setTitle(answers [3].text, for: .normal)
    }
    func updateMultipleStack (using answers: [Answer]) {
    multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
    multiLabel1.text = answers[0].text
    multiLabel2.text = answers [1].text
    multiLabel3.text = answers [2].text
    multiLabel4.text = answers [3].text
    }
    
    
    func updateRangedStack (using answers: [Answer]) {
    rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
    rangedLabel1.text = answers.first?.text
    rangedLabel1.text = answers.last?.text
    }
    
    // Create IBAction called 'singleAnswerButton Pressed' of Type 'UIButton'. Connect all 4 buttons in the    'SingleStackView' to the same control.
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions [questionIndex].answers
        // Switch statement for 'singleAnswerButton Pressed' IBAction, create a constant to hold the answers and go through each case for the 4 buttons. Append answers to 'answersChosen'. Next Question.
        
        switch sender {
        case singleButton1:
            chosenAnswers.append(currentAnswers[0])
        case singleButton2:
            chosenAnswers.append(currentAnswers [1])
        case singleButton3:
            chosenAnswers.append(currentAnswers [2])
        case singleButton4:
            chosenAnswers.append(currentAnswers [3])
        default:
        break
        }
        nextQuestion ()

    }
    
    

    @IBAction func multipleAnswerButtonPressed() {
        
        let currentAnswers = questions [questionIndex].answers
        
        if multiSwitch1.isOn {
            chosenAnswers.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            chosenAnswers.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            chosenAnswers.append(currentAnswers [2])
        }
        if multiSwitch4.isOn {
            chosenAnswers.append(currentAnswers[3])
        }
        nextQuestion ()
        
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        
        let currentAnswers = questions [questionIndex].answers
        let index = Int(round (rangedSlider.value * Float(currentAnswers.count - 1)))
        chosenAnswers.append(currentAnswers [index])
        nextQuestion ()
        
    }
    
    
    // Create a 'nextQuestion' function.
    
    func nextQuestion () {
        
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue (withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    
    
    
    
}
