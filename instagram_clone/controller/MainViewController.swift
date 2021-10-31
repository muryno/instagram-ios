//
//  MainViewController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 29/10/2021.
//

import UIKit

class MainViewController: UITabBarController{

    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()

    }

    // MARK: - Helper
    
    func configureViewController(){
        self.view.backgroundColor = .systemGray6

        if #available(iOS 15.0, *) {
           tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        let uiCollectionViewLayout = UICollectionViewFlowLayout()
        let feed =   templateNavigationController (unselectedImage: #imageLiteral(resourceName: "home_unselected"),selectedImage: #imageLiteral(resourceName: "home_selected"), viewController: FeedController(collectionViewLayout:  uiCollectionViewLayout))
        feed.title = "Feeds"
   
        let search =   templateNavigationController (unselectedImage: #imageLiteral(resourceName: "search_unselected"),selectedImage: #imageLiteral(resourceName: "search_selected"), viewController: SearchController())
        search.title = "Search"
        
        let imageScale =   templateNavigationController (unselectedImage: #imageLiteral(resourceName: "plus_unselected"),selectedImage: #imageLiteral(resourceName: "plus_unselected"), viewController: ImageSelectorController())
        imageScale.title = "Image Selector"
        
        let notiification =   templateNavigationController (unselectedImage: #imageLiteral(resourceName: "comment"),selectedImage: #imageLiteral(resourceName: "comment"), viewController: NotificationController())
        notiification.title = "Notification"
        
        let profile =   templateNavigationController (unselectedImage: #imageLiteral(resourceName: "profile_unselected"),selectedImage: #imageLiteral(resourceName: "profile_selected"), viewController: ProfileController())
        profile.title = "Profile"
    
        self.setViewControllers([feed , search , imageScale , notiification , profile ], animated: true)
        self.tabBar.tintColor = .black
        
    }
    
    func templateNavigationController(unselectedImage : UIImage, selectedImage : UIImage, viewController : UIViewController)->UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        
        if #available(iOS 15.0, *) {
            nav.navigationBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance
        }
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        
        return nav
    
    
        
}

}
