//
//  CustomTextField.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 26/11/2021.
//

import Foundation
import UIKit


class CustomTextField : UITextField {
    
    init(placeHolder: String) {
         super.init(frame: .zero)
        
        //text spacer
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
         leftView = spacer
        leftViewMode = .always
        
        
         borderStyle = .none
         textColor = .white
         keyboardAppearance = .dark
         keyboardType = .emailAddress
         backgroundColor = UIColor(white: 1, alpha: 0.1)
         setHeight(50)
         attributedPlaceholder = NSAttributedString(string:placeHolder,attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
