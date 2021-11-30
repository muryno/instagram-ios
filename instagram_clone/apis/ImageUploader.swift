//
//  ImageUploader.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 28/11/2021.
//

import Foundation
import UIKit
import FirebaseStorage


class ImageUploader {
    
   static   func uploadImage(image : UIImage , completion :@escaping(String?,Error?)->Void){
        
       guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
       
       let fileName = NSUUID().uuidString
       
       let ref = Storage.storage().reference(withPath: "profile_images\(fileName)")
       
       ref.putData(imageData , metadata : nil) {
           metadata, error in
           
           if let err = error{
               print("Error uploading image due to \(err.localizedDescription)")
               completion(nil,err)
               return
           }
           
           ref.downloadURL { (url,error) in
               guard let  imageUrl = url?.absoluteString else { return }
               completion(imageUrl,nil)
           }
          
       }
    }
}
