//
//  FinalScoreViewController.swift
//  Quizzler-iOS13
//
//  Created by Rosalyn Land on 10/11/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class FinalScoreViewController: UIViewController {
    var quizBrain: QuizBrain
    
    init?(coder: NSCoder, quizBrain: QuizBrain) {
        self.quizBrain = quizBrain
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a quizBrain.")
    }
}
