//
//  AuthViewController.swift
//  FirebaseSample
//
//  Created by Yo Higashida on 2021/02/14.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // アカウント作成: パスワード認証
    @IBAction func createEmailUser() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Success: createEmailUser")
            } else {
                print("Error: createEmailUser / ", error as Any)
            }
        }
    }
    
    // ログイン: パスワード認証
    @IBAction func loginEmailUser() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
            if error == nil {
                print("Success: loginEmailUser")
            } else {
                print("Error: loginEmailUser / ", error as Any)
            }
        })
    }
    
    // ログアウト
    @IBAction func signOut() {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            print("Success: signOut")
        } catch let singOutError as NSError {
            print("Error: signOut / ", singOutError)
        }
    }
}
