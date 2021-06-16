//
//  ViewController.swift
//  Ps Controller App
//
//  Created by Semih Özsoy on 3.05.2021.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var basketButton: UIButton!
    @IBOutlet weak var ControllerCollectionView: UICollectionView!
    @IBOutlet weak var UnselectedTabCollectionView: UICollectionView!
   
    
    let products : [Product] = [.init(image: UIImage(named: "whitePSController")),
                                .init(image: UIImage(named: "blackPSController"))]
    
    let selectItems:[SelectItem] = [.init(backgroundImg: UIImage(named: "selectedTabBackground"), controllerImg: UIImage(named: "controllerTab")),
                                   .init(backgroundImg: UIImage(named: "unselectedTabBackground"), controllerImg: UIImage(named: "devicesTab")),
                                   .init(backgroundImg: UIImage(named: "unselectedTabBackground"), controllerImg: UIImage(named: "mouse"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ControllerCollectionView.dataSource = self
        UnselectedTabCollectionView.dataSource = self
        ControllerCollectionView.delegate = self
        UnselectedTabCollectionView.delegate = self
    
        
        let controllerNib = UINib(nibName: "ControllerCollectionViewCell", bundle: .main)
        ControllerCollectionView.register(controllerNib, forCellWithReuseIdentifier: "psControllerIdentifier")
        
        let unselectedTabNib = UINib(nibName: "UnselectedTabCollectionViewCell", bundle: .main)
        UnselectedTabCollectionView.register(unselectedTabNib, forCellWithReuseIdentifier: "unselectedTabIdentifier")
    }
    
    @IBAction func basketButtonTapped() {
        print("basket button tapped")
    }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ControllerCollectionView{
            return products.count
        } else {
            return selectItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.ControllerCollectionView{
            
            guard let cellController = collectionView.dequeueReusableCell(withReuseIdentifier: "psControllerIdentifier", for: indexPath) as? ControllerCollectionViewCell else {
                return .init()}
            let product = products[indexPath.item]
            cellController.configure(image: product.image)
            return cellController
            
        } else {
            guard let cellUnselected = collectionView.dequeueReusableCell(withReuseIdentifier: "unselectedTabIdentifier", for: indexPath) as? UnselectedTabCollectionViewCell else{
                return .init()}
            let selectItem = selectItems[indexPath.item]
            cellUnselected.configure(backgroundImg: selectItem.backgroundImg, image: selectItem.controllerImg)
            return cellUnselected
        }
        
    }
    
    
    
    
}

