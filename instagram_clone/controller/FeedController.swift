//
//  FeedController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 30/10/2021.
//

import UIKit

private let reuseableIdwntifier = "feedControllers"
class FeedController: UICollectionViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationChange()

        
        // Do any additional setup after loading the view.
    }
    

 
    // MARK: - Helper

    func configurationChange(){
        collectionView.backgroundColor = .white
        self.collectionView.register(FeedCell.self , forCellWithReuseIdentifier: reuseableIdwntifier)
    }
    
}


extension FeedController {
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cells = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdwntifier, for: indexPath) as! FeedCell
        return cells
    }
}

extension FeedController : UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.view.frame.width, height: 550)
    }
}
