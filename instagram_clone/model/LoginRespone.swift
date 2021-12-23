//
//  LoginRespone.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 07/12/2021.
//

import Foundation


class LoginResponse : Codable{
    var data : User?
}


class User: Codable{
    var email : String?
    var fullname : String?
    var urlIImage : String?
    var uuid : String?
    var token : String?
    
    
    enum CodingKeys: String, CodingKey {
        case email = "email",
        urlIImage = "photoURL",
             fullname  = "usernname",
        uuid = "userID"
    }
}
