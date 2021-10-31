//
//  FeedController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 30/10/2021.
//

import UIKit

class FeedController: UICollectionViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationChange()

        
        // Do any additional setup after loading the view.
    }
    

 
    // MARK: - Helper

    func configurationChange(){
        self.collectionView.backgroundColor = .systemBlue
    }

}
