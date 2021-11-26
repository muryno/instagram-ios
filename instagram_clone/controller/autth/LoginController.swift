//
//  LoginController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 16/11/2021.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configured()
    }
    

  private func configured(){
    
      view.backgroundColor = .white
      navigationController?.navigationBar.isHidden = true
      
      let gradient = CAGradientLayer()
      gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
      gradient.locations = [0,1]
      view.layer.addSublayer(gradient)
      gradient.frame = view.frame
      
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
