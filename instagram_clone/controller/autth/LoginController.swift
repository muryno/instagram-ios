//
//  LoginController.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 16/11/2021.
//

import UIKit

class LoginController: UIViewController {

    //MARK: - properties
    
     var loginViewModel = LoginViewModel()
    
    let instagramLogo : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "Instagram_logo_white")
        return iv
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
    
    let loginButton : UIButton = {
        let ib = UIButton(type: .system)
        ib.customButtonAppearance(placeHolder: "Login")
        ib.addTarget(self, action: #selector(login), for: .touchUpInside)
        ib.isEnabled = false
        return ib
    }()
    
    let forgotPassword : UIButton = {
        let ib = UIButton(type: .system)
        ib.attributedTitle(firstPart: "Forgot your password? ", secondPart:  "Get help signing in.")
        return ib
    }()
    
    let dontHaveAnAccount : UIButton = {
        let ib = UIButton(type: .system)
        ib.attributedTitle(firstPart: "Don't have an account?  ", secondPart:  "SignUp")
        ib.addTarget(self, action: #selector(navigateToSignUp), for: .touchUpInside)
        return ib
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configured()
        
        view.addSubview(instagramLogo)
        instagramLogo.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        instagramLogo.centerX(inView: view)
        instagramLogo.setDimensions(height: 80, width: 130)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField, loginButton,forgotPassword])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: instagramLogo.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor, paddingTop: 40,paddingLeft: 20,paddingRight: 20)
        stackView.centerX(inView: view)
        
        
        view.addSubview(dontHaveAnAccount)
        dontHaveAnAccount.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor,  paddingBottom: 20 )
        dontHaveAnAccount.centerX(inView: view)
    }
    
    
    

  private func configured(){
      view.backgroundColor = .white
      navigationController?.navigationBar.isHidden = true
      //change the bar color
      navigationController?.navigationBar.barStyle = .black

      self.configureGradientLayer()
      onTextChange()
  }
    
    
    private func onTextChange(){
        emailTextField.addTarget(self, action: #selector(textFieldValidator), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldValidator), for: .editingChanged)
    }

    
   
    // MARK: - action

   

    @objc func navigateToSignUp(){
        let registrationController = RegistrationController()
        navigationController?.pushViewController(registrationController, animated: true)
    }
    
    @objc func textFieldValidator(senderTextField : UITextField){
        if senderTextField === emailTextField {
            loginViewModel.emailText = senderTextField.text
        }
        else{
            loginViewModel.passwordText = senderTextField.text
        }
        
        loginButton.isEnabled = loginViewModel.isFormValid
        loginButton.backgroundColor = loginViewModel.buttonBackgroundColor
        loginButton.setTitleColor(loginViewModel.buttonTextColor, for: .normal)

    }
    
    @objc func login(){
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        
    
        showLoader(true)
        AuthService.Login(email: email, password: password) { user, error in
            if let isError =  error  {
                self.showMessage(withTitle: "Error", message: isError.localizedDescription)
                print("Error occur due to :\(isError)")
                self.showLoader(false)
                return
            }
        
            
            print("Successfully sign in")
            self.showLoader(false)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
