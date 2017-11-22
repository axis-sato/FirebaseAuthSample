//
//  ViewController.swift
//  FirebaseAuthSample
//
//  Created by Masahiko Sato on 2017/11/22.
//  Copyright © 2017年 Masahiko Sato. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController {
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    private var handler: FIRAuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let user = FIRAuth.auth()?.currentUser
        print(user)

//        handler = FIRAuth.auth()?.addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                print("User is signed in with uid:", user.uid)
//            } else {
//                print("No user is signed in.")
//            }
//        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        if let handler = handler {
//            FIRAuth.auth()?.removeStateDidChangeListener(handler)
//        }
    }
}

extension ViewController: GIDSignInUIDelegate {
    
}

