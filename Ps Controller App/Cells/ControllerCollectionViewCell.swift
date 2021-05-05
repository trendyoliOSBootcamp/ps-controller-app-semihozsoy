
 //
 //  ControllerCollectionViewCell.swift
 //  Ps Controller App
 //
 //  Created by Semih Özsoy on 3.05.2021.
 //

 import UIKit

 final class ControllerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(image: UIImage?) {
        imageView.image = image
         
     }

 }


