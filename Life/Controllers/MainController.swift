//
//  ViewController.swift
//  Life
//
//  Created by Павел Попов on 06/06/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    var lbName = ["Inner Life", "Personal Life", "Social Life"]
    var imgLife = [#imageLiteral(resourceName: "Inner Life"), #imageLiteral(resourceName: "Personal Life"), #imageLiteral(resourceName: "Social Life")]
    var lbDescription = ["insecurity, guilt, fears, destiny, meaning of life", "relationships with spouse, parents, and kids, love, friendship, sex, existence", "study, career, business, goals, progress, achievements"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //вот такой должен быть этот метод и класс
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension MainController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lbName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        cell.setupCellWith(title: lbName[indexPath.row], img: imgLife[indexPath.row], descr: lbDescription[indexPath.row])
        return cell
    }
    
    //new page
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = lbName[indexPath.row]
        let viewController = (storyboard?.instantiateViewController(withIdentifier: name))!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
