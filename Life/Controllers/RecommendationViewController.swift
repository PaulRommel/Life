//
//  RecommendationViewController.swift
//  Life
//
//  Created by Павел Попов on 26/07/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    @IBOutlet weak var recommendationNameLabel: UILabel!
    @IBOutlet weak var recommendationTextView: UITextView! // your textView
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
        let ats = [NSAttributedString.Key.font: recommendationTextView.font, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        recommendationTextView.attributedText = NSAttributedString(string: personCharacter.recommendation, attributes: ats as [NSAttributedString.Key : Any])
    }
    
    fileprivate func setupBaseUi() {
        button.setTitle("Home", for: .normal)
        button.layer.cornerRadius = 10
        recommendationTextView.layer.cornerRadius = 20
        recommendationTextView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
