//
//  ViewController.swift
//  ecommerce
//
//  Created by admin on 6/27/22.
//

import UIKit
import CoreData
import KeychainSwift
class LoginViewController: UIViewController, UITextFieldDelegate {
   
    @IBAction func accountButton(_ sender: Any) {
    }
    
    @IBAction func rememberSwitch(_ sender: Any) {
        
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func allFieldsFilledOut() -> Bool {
        if(userNameTextField.text != "" && passwordTextField.text != ""){
            return true
        }else{
            return false
        }
    }

  
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        userNameTextField.delegate = self
        
    
       
      
        
             }
        @objc func handleTap(sender: UITapGestureRecognizer) {
           
               print("false")
                passStack.isHidden = false
                
            
          }
    
    //@IBOutlet weak var mainStack: UIStackView!
    
    @IBOutlet weak var userStack: UIStackView!
    @IBOutlet weak var passStack: UIStackView!
    @IBOutlet var gestureRec: UITapGestureRecognizer!
    
    @IBOutlet var ViewTap: UIView!
    
    //func
    

    //sign in errors in red text below textfield
    @IBOutlet weak var userDNE: UILabel!
    @IBOutlet weak var passwordIncorrect: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //textfield error logic
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        switch textField{
        case userNameTextField:
            if(userNameTextField.text == ""){
                userDNE.isHidden = false
            }else
            {
                userDNE.isHidden = true
            }
      
        case passwordTextField:
            if(passwordTextField.text != ""){
                
                passwordIncorrect.isHidden = true
            }else
            {
                passwordIncorrect.isHidden = false
            }
        
            
        default:
            break
        }
    }
    
    

    @IBAction func NewAccount(_ sender: Any) {
    }
    @IBAction func enterGuest(_ sender: Any) {
    }
    @IBAction func loginButton(_ sender: Any) {
    
        
    
    }
}
