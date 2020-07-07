//
//  FearOfRelationshipsViewController.swift
//  Life
//
//  Created by Павел Попов on 26/06/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class QuestionnaireController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    //Single Stack Outlets
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    
    let images = ["Question Background 1", "Question Background 2", "Question Background 3"]
    
    //вопросы и ответы на них
    //перенес в QuestionData
    
    var selectedQuestionable: Questionable!
    var questionIndex = 0
    var answersChosen: [Bool] = []
    
    internal static func instantiate(with selectedQuestionable: Questionable) -> QuestionnaireController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionnaireController") as! QuestionnaireController
        vc.selectedQuestionable = selectedQuestionable
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setupView()
    }
    
    private func setupView() {
        imageView.image = randomImage()
        singleButton1.backgroundColor = UIColor.white
        singleButton1.layer.cornerRadius = 10
        singleButton2.layer.cornerRadius = 10
    }

    //update Q&A, progressView, NavigationTitle
    func updateUI() {
        singleStackView.isHidden = true
        let currentQuestion = selectedQuestionable.questions[questionIndex]
        questionLabel.text = currentQuestion
        questionNumberLabel.text = "Question \(getQuestionStringNumber(questionIndex + 1).capitalizingFirstLetter())"
        updateSingleStackView()
    }
    
    //установка заголовка для кнопки.
    func updateSingleStackView() {
        singleStackView.isHidden = false
        singleButton1.setTitle("No", for: .normal)
        singleButton2.setTitle("Yes", for: .normal)
    }
    
    //Button Actions sending answer type to answersChosen array, going to next question or results
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        sender.tag == 0 ? answersChosen.append(false) : answersChosen.append(true)
//        print("User Answers: \(answersChosen)")
        setupView()
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < selectedQuestionable.questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let RVC = segue.destination as? ResultsViewController
            RVC?.personCharacter = selectedQuestionable.getMostPredefinedAnswer(with: answersChosen)
        }
    }
    
    //получение номера текстом
    private func getQuestionStringNumber(_ index: Int) -> String {
        let numberWords = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twenty-one", "twenty-two", "twenty-three", "twenty-four", "twenty-five"]
        return numberWords[index-1]
    }
    
    private func randomImage() -> UIImage {
        let idx = Int(arc4random_uniform(UInt32(images.count)))
        guard let image = UIImage(named: images[idx]) else { fatalError() }
        return image
    }

}

