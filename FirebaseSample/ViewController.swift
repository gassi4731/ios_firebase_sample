//
//  ViewController.swift
//  FirebaseSample
//
//  Created by Yo Higashida on 2021/02/14.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 認証状態をリッスンする
        handle = Auth.auth().addStateDidChangeListener{ (auth, user ) in
            // add code
        }
        Auth.auth().removeStateDidChangeListener(handle!)
    }

}

