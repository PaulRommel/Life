//
//  ResultsViewController.swift
//  Life
//
//  Created by Павел Попов on 12/07/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultsNameLabel: UILabel!
    @IBOutlet weak var resultsTextView: UITextView!
    @IBOutlet weak var button: UIButton!

    var responses: [Answer]!
    var textOfRecommendation = String()
    var recommendationTextView = ["It is a classic example of early-onset depression. Yet, it follows a benign course so it is can be healed. You need to develop a constantly high level of autonomy and independence in order to be free from your dependencies. You should work on enriching your inner life so you could feel safe and sound inside yourself. Your issues would be addressed in a quicker and more efficient way if you decided to see a therapist. Best of luck.", "You need to develop a more open perspective on life. Try to loosen up, set yourself free from your inner fears and complexes. Dance classes or some drama club might do the job. You should try to let go of control. Trust others a little bit more than usual. Begin to change your life at least in tiny little things. You will see how you will like it gradually. Try  to embrace the thought that quite often, there is more than one thing to do, more than one way to go. Be sure that the decision that you made was the right one at that very moment so quit thinking about it afterwords. Pursue career in Government Sector, Surgery, Finances and Banking, Law, or Education. You can see a Therapist if you have a chance, you should choose them by yourself though. Best of luck!", "It is advisable that you see a Therapist in order to explore your childhood. It was the time when you evolved as a person, with your personhood and gender identity. You should learn how to be mutually in love. You should not demand too much from your partner, friends, and family. It is a good thing to accept the idea that your partner is also entitled to freedom just like you. You can embrace the thought that you will always be beautiful and attractive at any age. Develop your inner world beauty. Do not ask for “Big” love right away, start small. Do not be afraid of setbacks and failure. Try to avoid merging with your partner, getting identified with them. You should fall in love with your own unique self. Eventually, it will help you to fall in love with your partner’s unique self. Do not forget that people love you because of your liveliness, open-mindedness, and mirth. Best of luck!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recommendationsOfDiagnosis  = calculatePersonalityResult()
        setRecommendation(recommendationsOfDiagnosis: recommendationsOfDiagnosis)
        
        button.backgroundColor = UIColor.white
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 10
        resultsTextView.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Button Action
    @IBAction func clickButton(_ sender: Any) {
        if button.tag == 1{
            print("Кнокпа 1")

            let userDefaultStore = UserDefaults.standard //userDefault object
            userDefaultStore.set(textOfRecommendation, forKey: "key_Value") //store textView value in userDefault

            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Recommendations") as! RecommendationViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculatePersonalityResult() -> PersonCharacter{
        var frequencyOfAnswers: [PersonCharacter:Int] = [:]
        let responseType = responses.map {$0.type}
        for response in responseType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in return pair1.value > pair2.value})
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultsNameLabel.text = "Diagnosis"
        resultsTextView.text = mostCommonAnswer.diagnosis
        
        return mostCommonAnswer
    }

    func setRecommendation(recommendationsOfDiagnosis: PersonCharacter) {
        switch recommendationsOfDiagnosis {
        case .CQ1:
            textOfRecommendation = recommendationTextView[0]
        case .CQ2:
            textOfRecommendation = recommendationTextView[1]
        case .CQ3:
            textOfRecommendation = recommendationTextView[2]
        }
  }
}

