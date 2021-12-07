//
//  FeedController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 30/10/2021.
//

import UIKit
import Firebase

private let reuseableIdwntifier = "feedControllers"
class FeedController: UICollectionViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationChange()

        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: action
    
 
    @objc private func logout(){
         do{
             try  Auth.auth().signOut()
             let nav = UINavigationController(rootViewController: LoginController())
             nav.modalPresentationStyle = .fullScreen
             self.present(nav, animated: true, completion: nil)
                
         }catch {
             printContent("Error occur")
         }
     }
    
 
    // MARK: - Helper

    func configurationChange(){
        collectionView.backgroundColor = .white
        self.collectionView.register(FeedCell.self , forCellWithReuseIdentifier: reuseableIdwntifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
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
