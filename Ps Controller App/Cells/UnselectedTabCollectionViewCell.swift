//
//  UnselectedTabCollectionViewCell.swift
//  Ps Controller App
//
//  Created by Semih Özsoy on 3.05.2021.
//

import UIKit

class UnselectedTabCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var controllerImage: UIImageView!
    
    func configure(backgroundImg: UIImage?, image:UIImage?) {
        backgroundImage.image = backgroundImg
        controllerImage.image = image
    }
}
