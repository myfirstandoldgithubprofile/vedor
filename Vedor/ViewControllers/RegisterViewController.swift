//
//  RegisterViewController.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerButtonDidTouch(sender: AnyObject) {
        
        let newUser = PFUser()
        
        newUser.username = userNameLabel.text
        newUser.password = passwordLabel.text
        newUser.email = emailLabel.text
        
        newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
            
            if ((error) != nil) {
                let alert = UIAlertView(title: "Erro", message: "Erro ao efetuar o cadastro.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                
            } else {
                let alert = UIAlertView(title: "Sucesso", message: "Cadastrado com sucesso.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
//                    let defaults = NSUserDefaults.standardUserDefaults()
//                    
//                    // I know it's not good but time's running out
//                    defaults.setObject(newUser, forKey: "email")
//                    defaults.setObject(newUser.password, forKey: "password")
//                    
//                    example
//                    defaults.objectForKey("email")
                    
                    self.performSegueWithIdentifier("LoginSegue", sender: nil)
                })
            }
        })
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toView = segue.destinationViewController as! LoginViewController
        toView.userName = userNameLabel.text
        toView.password = passwordLabel.text
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}
