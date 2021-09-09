//
//  ViewController.swift
//  Resume App
//
//  Created by Julia on 06.09.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    // MARK: - IB Outlets
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    // MARK: - Private Properties
    private let user = User(userName: "User", password: "Password")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.autocorrectionType = .no
        passwordField.autocorrectionType = .no
        
        userNameField.delegate = self
        passwordField.delegate = self
        
        passwordField.isSecureTextEntry = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        welcomeVC.welcome = "Welcome, \(user.userName)!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func pressLogIn() {
        isAnEntrancePermit()
    }
    
    @IBAction func pressForgotUserName() {
        showAlert(with: "Oops!", and: "Your User Name - \(user.userName).")
    }
    
    @IBAction func pressForgotPassword() {
        showAlert(with: "Oops!", and: "Your Password - \(user.password).")
    }
    
    @IBAction func pressLogOut(segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
    
    // MARK: - Public Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            passwordField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: - Private Methods
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func isAnEntrancePermit() {
        if userNameField.text?.isEmpty == true && passwordField.text?.isEmpty == true {
            showAlert(with: "Your fields is empty", and: "Please fill in all the fields to log in.")
            return
        } else if userNameField.text != user.userName {
            showAlert(with: "Your User Name is wrong", and: "Please check your User Name.")
            return
        } else if passwordField.text != user.password {
            showAlert(with: "Your Password is wrong", and: "Please check your Password.")
            return
        } else {
            performSegue(withIdentifier: "TabBarSegue", sender: nil)
        }
    }
}


