//
//  AuthenticationViewModel.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 27/11/2021.
//

import Foundation
import UIKit


struct LoginViewModel{
    var emailText : String?
    var passwordText : String?
    var isFormValid : Bool  { return emailText?.isEmpty == false && passwordText?.isEmpty == false}

    
    var buttonBackgroundColor : UIColor {
        return isFormValid ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1).withAlphaComponent(0.5)
    }
    var buttonTextColor : UIColor {
        return isFormValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).withAlphaComponent(0.5)
    }
    
}

struct RegistrationViewModel{
    var emailText : String?
    var passwordText : String?
    var userName : String?
    var fullName : String?
    var isFormValid : Bool  { return emailText?.isEmpty == false && passwordText?.isEmpty == false && userName?.isEmpty == false && fullName?.isEmpty == false}

    
    var buttonBackgroundColor : UIColor {
        return isFormValid ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1).withAlphaComponent(0.5)
    }
    var buttonTextColor : UIColor {
        return isFormValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).withAlphaComponent(0.5)
    }
}
