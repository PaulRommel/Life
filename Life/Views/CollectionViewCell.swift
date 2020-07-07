//
//  CollectionViewCell.swift
//  Life
//
//  Created by Павел Попов on 06/06/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lifeImage: UIImageView!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var lifeDescription: UILabel!
    
    func setupCellWith(title: String, img: UIImage, descr: String) {
        lifeLabel.text = title
        lifeImage.image = img
        lifeDescription.text = descr
        setupCellUi()
    }
    
    private func setupCellUi() {
        lifeImage.layer.cornerRadius = 20.0
        contentView.layer.cornerRadius = 20.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = false
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 0
        layer.shadowOpacity = 11.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
}
