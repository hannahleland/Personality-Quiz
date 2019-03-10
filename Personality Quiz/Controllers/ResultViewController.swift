//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by student5 on 3/9/19.
//  Copyright © 2019 Hannah Leland. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var responses : [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers : [PersonType : Int] = [:]
        let responseTypes = responses.map { $0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
                ?? 0) + 1
        } // end for loop
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        resultDescriptionLabel.text = mostCommonAnswer.definition
        
    } // end func calculatePersonalityResult
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToBeginningWithSegue", sender: self)
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
