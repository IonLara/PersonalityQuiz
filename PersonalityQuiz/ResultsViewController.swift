//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Ion Sebastian Rodriguez Lara on 26/04/23.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    var responses: [Answer]
    override func viewDidLoad() {
        super.viewDidLoad()

        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    init?(coder: NSCoder, answers: [Answer]) {
        self.responses = answers
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
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
