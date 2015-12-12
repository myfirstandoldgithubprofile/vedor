//
//  LoginViewController.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userName: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  userName != nil && password != nil {
            userNameLabel.text = userName
            passwordTextField.text = password
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonDidTouch(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(userNameLabel.text!, password: passwordTextField.text!, block: { (user, error) -> Void in
            
            if ((user) != nil) {
                let alert = UIAlertView(title: "Sucesso", message: "Login realizado com sucesso.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDelegate.user = user
                    
                    self.performSegueWithIdentifier("InitViewSegue", sender: nil)
                })
                
            } else {
                let alert = UIAlertView(title: "Erro", message: "Erro ao realizar o login.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        })
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

}
