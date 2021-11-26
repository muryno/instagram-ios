//
//  ImageSelectorController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 30/10/2021.
//

import UIKit

class ImageSelectorController: UIViewController {

    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is label view."
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
            
            // Set its constraint to display it on screen
            myLabel.widthAnchor.constraint(equalToConstant:  200).isActive = true
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
