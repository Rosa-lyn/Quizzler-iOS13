//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!


    var quizBrain  = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        if quizBrain.isLastQuestion {
            showFinalScoreScreen()
        } else {
            quizBrain.nextQuestion()
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let quizAnswers = quizBrain.getAnswers()
        choice1Button.setTitle(quizAnswers[0], for: .normal)
        choice2Button.setTitle(quizAnswers[1], for: .normal)
        choice3Button.setTitle(quizAnswers[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }

    func showFinalScoreScreen() {
        guard let vc = storyboard?.instantiateViewController(identifier: "FinalScoreViewController", creator: { coder in
            return FinalScoreViewController(coder: coder)
        }) else {
            fatalError("Failed to load FinalScoreViewController from storyboard.")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
}

