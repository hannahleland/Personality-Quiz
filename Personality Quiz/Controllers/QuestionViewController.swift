//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by student5 on 3/9/19.
//  Copyright © 2019 Hannah Leland. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // global identifiers
    var questionIndex = 0
    var answersChosen : [Answer] = []
    
    // UI outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiLabel5: UILabel!
    @IBOutlet weak var multiLabel6: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    @IBOutlet weak var multiSwitch5: UISwitch!
    @IBOutlet weak var multiSwitch6: UISwitch!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    @IBOutlet weak var singleButton5: UIButton!
    @IBOutlet weak var singleButton6: UIButton!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    } // end override viewDidLoad
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) /
            Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated:
            true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        } // end currentQuestion
        
    } // end func updateUI
    
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        singleButton5.setTitle(answers[4].text, for: .normal)
        singleButton6.setTitle(answers[5].text, for: .normal)
    } // end func updateSingleStack
    
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiSwitch5.isOn = false
        multiSwitch6.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        multiLabel5.text = answers[4].text
        multiLabel6.text = answers[5].text
    } // end func updateMultipleStack
    
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(3.0, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    } // end func updateRangedStack
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        case singleButton5:
            answersChosen.append(currentAnswers[4])
        case singleButton6:
            answersChosen.append(currentAnswers[5])
        default:
            break
        } // end switch sender
        
        nextQuestion()
    } // end IBAction singleAnswerButtonPressed
    
    
    
    
    @IBAction func multipleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        if multiSwitch5.isOn {
            answersChosen.append(currentAnswers[4])
        }
        if multiSwitch6.isOn {
            answersChosen.append(currentAnswers[5])
        } // end ifs
        
        nextQuestion()
        
    } // end IBAction multipleAnswerButtonPressed
    
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value *
            Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    } // end IBAction rangedAnswerButtonPressed
    
    
    func nextQuestion() {
        print(answersChosen[questionIndex])
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        } // end if-else
    } // end func nextQuestion
    
    
    
    
    
    
    
    
    
    
    // prep segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.responses = answersChosen
        }
    }
 

}
