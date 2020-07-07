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

    var personCharacter: PersonCharacter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDiagnosisTextView()
        setupBaseUi()
    }
    
    fileprivate func setupDiagnosisTextView() {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 11.0
        let ats = [NSAttributedString.Key.font: resultsTextView.font, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        resultsTextView.attributedText = NSAttributedString(string: personCharacter.diagnosis, attributes: ats as [NSAttributedString.Key : Any])
    }
    
    fileprivate func setupBaseUi() {
        resultsNameLabel.text = "Diagnosis"
        button.setTitle("Continue", for: .normal)
        button.layer.cornerRadius = 10
        resultsTextView.layer.cornerRadius = 20
        resultsTextView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    //MARK: - Button Action
    
    @IBAction func clickButton(_ sender: Any) {
        if button.tag == 1 {
            print("Кнокпа 1")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Recommendations") as! RecommendationViewController
            newViewController.personCharacter = personCharacter
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }

}
