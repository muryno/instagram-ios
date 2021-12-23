//
//  AuthService.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 28/11/2021.
//

import Foundation
import Firebase


class AuthService {
    
    static func Register(registration registrationModel : RegistrationModel,completion : @escaping(Error?)->Void){
        print(registrationModel)
        
        
        ImageUploader.uploadImage(image: registrationModel.urlIImage) { resultUrl,error  in
         
            if  let error = error  {
                completion(error)
                return
            }
            
            
            Auth.auth().createUser(withEmail: registrationModel.email, password: registrationModel.password) { (result, error) in
                if let err = error{
                    print("Error occur due to \(err.localizedDescription)")
                    completion(error)
                    return
                }
                
                if let uuId = result?.user.uid {
                    
                    guard  let url = resultUrl else {  return}
        
                    let data: [String: Any ] = [
                        "profileImageUrl": url,
                        "email": registrationModel.email,
                        "password" : registrationModel.password,
                        "uid":uuId,
                        "userName":registrationModel.fullname
                    ]
                    
                    Firestore.firestore().collection("InstagramCloneUser").document(uuId).setData(data){
                        error in
                        if let err = error{
                            completion(err)
                            return
                        }
                        
                        completion(nil)
                    }
                }
            }
        }
    }
    
    static func Login(email: String,password: String, completion : @escaping(String?, Error?)-> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let err = error{
                completion(nil,err)
                return
            }
            
            if let uuId = result?.user.uid {
                completion(uuId, nil)
            }else{
                completion(nil, nil)
            }
//            let decoder = JSONDecoder()
//            do{
//                let result = try! decoder.decode(LoginResponse.self, from: result!  as! Data)
//                completion(result.data,nil)
//            }catch{
//                completion(nil, nil)
//            }
            
    
     
        }
        
    }
}
