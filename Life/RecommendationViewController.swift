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
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //--
            let userDefault = UserDefaults.standard //create UserDefault object
            
            recommendationTextView.text = userDefault.string(forKey: "key_Value")!//get userdefault value using same key which used to store date and set in textView
            recommendationTextView.isUserInteractionEnabled = false
        
        //--

        // Do any additional setup after loading the view.
        button.backgroundColor = UIColor.white
        button.setTitle("Home", for: .normal)
        button.layer.cornerRadius = 10
        recommendationTextView.layer.cornerRadius = 20
    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
