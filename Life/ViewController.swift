//
//  ViewController.swift
//  Life
//
//  Created by Павел Попов on 06/06/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var lbName = [String]()
    var imgLife = [UIImage]()
    var lbDescription = [String]()
    //var lifeButton = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        lbName = ["Inner Life", "Personal Life", "Social Life"]
        imgLife = [#imageLiteral(resourceName: "Inner Life"), #imageLiteral(resourceName: "Personal Life"), #imageLiteral(resourceName: "Social Life")]
        lbDescription = ["insecurity, guilt, fears, destiny, meaning of life", "relationships with spouse, parents, and kids, love, friendship, sex, existence", "study, career, business, goals, progress, achievements"]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lbName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.lifeLabel.text = lbName[indexPath.row]
        cell.lifeImage.image = imgLife[indexPath.row]
        cell.lifeDescription.text = lbDescription[indexPath.row]
        //cell.lifeButton.buttonType = lifeButton[indexPath.row]
        
        //This creates the shadows and modifies the cards a little bit
        cell.lifeImage.layer.cornerRadius = 20.0
        cell.contentView.layer.cornerRadius = 20.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.white.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 0
        cell.layer.shadowOpacity = 11.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    //new page
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = lbName[indexPath.row]
        let viewController = (storyboard?.instantiateViewController(withIdentifier: name))!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
