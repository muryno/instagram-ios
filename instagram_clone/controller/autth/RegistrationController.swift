//
//  RegistrationController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 16/11/2021.
//

import UIKit

class RegistrationController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var registrationViewModel = RegistrationViewModel()
   
    var uiImage : UIImage?
    
    //MARK: - Property
    let plushPhotoButton : UIButton = {
        let ib = UIButton(type: .system)
        ib.setImage( #imageLiteral(resourceName: "plus_photo"), for: .normal)
        ib.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        ib.tintColor = .white
        return ib
    }()
    let emailTextField : UITextField = {
        let tf = CustomTextField(placeHolder: "Email")
        tf.keyboardType = .emailAddress
        
       return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = CustomTextField(placeHolder: "Password")
        tf.isSecureTextEntry = true
       return tf
    }()
    let fullNameTextField : UITextField = {
        let tf = CustomTextField(placeHolder: "Fullname")
        tf.keyboardType = .emailAddress
       return tf
    }()
    
    let userNameTextField : UITextField = {
        let tf = CustomTextField(placeHolder: "Username")
        tf.keyboardType = .emailAddress
       return tf
    }()
    
    
    let signUpButton : UIButton = {
        let ib = UIButton(type: .system)
        ib.customButtonAppearance(placeHolder: "SignUp")
        ib.addTarget(self, action: #selector(Register), for: .touchUpInside)
        ib.isEnabled = false
        return ib
    }()
    
    let alreadyHaveAnAccount : UIButton = {
        let ib = UIButton(type: .system)
        ib.attributedTitle(firstPart: "Already have an account? ", secondPart:  "Login.")
        ib.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        return ib
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subView()
        onTextChange()
    }
    
    //MARK: lifecycle
    private func subView(){
        self.configureGradientLayer()
        let stackView = UIStackView(arrangedSubviews: [plushPhotoButton, emailTextField,passwordTextField, fullNameTextField, userNameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.safeAreaLayoutGuide.leftAnchor,
                         right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingRight: 20)
        stackView.centerX(inView: view)
        view.addSubview(alreadyHaveAnAccount)
        alreadyHaveAnAccount.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 30)
        alreadyHaveAnAccount.centerX(inView: view)
    }
    private func onTextChange(){
        emailTextField.addTarget(self, action: #selector(textFieldValidator), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldValidator), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textFieldValidator), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textFieldValidator), for: .editingChanged)
    }

    // MARK: -  Action
    @objc func navigateToLogin(){
        navigationController?.popViewController(animated:  true)
    }

    
    @objc func textFieldValidator(senderTextField : UITextField){
        if senderTextField === emailTextField {
            registrationViewModel.emailText = senderTextField.text
        }else  if senderTextField === userNameTextField {
            registrationViewModel.userName = senderTextField.text
        } else if senderTextField === fullNameTextField {
            registrationViewModel.fullName = senderTextField.text
        }
        else{
            registrationViewModel.passwordText = senderTextField.text
        }
        
        signUpButton.isEnabled = registrationViewModel.isFormValid
        signUpButton.backgroundColor = registrationViewModel.buttonBackgroundColor
        signUpButton.setTitleColor(registrationViewModel.buttonTextColor, for: .normal)

    }
    
    
    @objc func addImage(){
        let imagePickers  = UIImagePickerController()
        imagePickers.delegate = self
        imagePickers.allowsEditing = true
        self.present(imagePickers, animated: true)
    }
    
    @objc func Register(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
       guard let profileImage = uiImage else { return }
        
        
        showLoader(true)
              let registationData =   RegistrationModel(email: email, password: password, fullname: fullName, urlIImage: profileImage)
        AuthService.Register(registration: registationData){
            error in
            
            if let isError = error {
                self.showMessage(withTitle: "Error", message: isError.localizedDescription)
                print("Error occur due to :\(isError)")
                self.showLoader(false)
            return
            }
            
            print("Successfully added to firestore")
            self.showLoader(false)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.uiImage = image
        
        plushPhotoButton.setDimensions(height: 100, width: 100)
        plushPhotoButton.layer.cornerRadius = plushPhotoButton.frame.width / 2
        plushPhotoButton.layer.masksToBounds = true
        plushPhotoButton.layer.borderColor = UIColor.white.cgColor
        plushPhotoButton.layer.borderWidth = 2
        
        plushPhotoButton.setImage(image.withRenderingMode(.alwaysOriginal) , for: .normal)
        self.dismiss(animated: true,completion: nil)
        
  
    }
}




