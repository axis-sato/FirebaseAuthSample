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
    private var handler: FIRAuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let user = FIRAuth.auth()?.currentUser
        if let user = user {
            print(user.uid)
            print(user.email ?? "")
            print(user.photoURL ?? "")
        }
    }
    
    
    @IBAction func didTapLogoutButton(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
    }
}


extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(
            withIDToken: authentication.idToken,
            accessToken: authentication.accessToken
        )
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("ログイン成功 \(user.profile)")
    }
}


extension ViewController: GIDSignInUIDelegate {

}

