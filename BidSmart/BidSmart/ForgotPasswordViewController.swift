//
//  ForgotPasswordViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 05/04/22.
//

import UIKit
import nanopb

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var resetPwdBtnOutlet: UIButton!
    
    @IBOutlet weak var userNameOutlet: UITextField!
    
    var users = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Forgot Password"

        // Do any additional setup after loading the view.
        resetPwdBtnOutlet.isEnabled = false
    }

    @IBAction func resetPasswordBtn(_ sender: Any) {
        
        let pwd = newPassword.text!
        let confirmPwd = confirmPassword.text!
        var RoleNew = ""
        var RoleIdNew:Int = -1
        var email = ""
        var phone = 0
        
        if(pwd == confirmPwd){
            
            databaseRef.child("users").child(userNameOutlet.text!).observeSingleEvent(of: .value) { snapshot in
                if(snapshot.exists()){
                    self.users = snapshot.value as! NSDictionary
                    
                    for (key, value) in self.users{
                      // print(key,value)
                        if(key as! String == "Role"){
                            RoleNew = value as! String
                        }
                        
                        if(key as! String == "RoleId"){
                            RoleIdNew = value as! Int
                        }
                        
                        if(key as! String == "email"){
                            email = value as! String
                        }
                        
                        if(key as! String == "phone"){
                            phone = value as! Int
                        }
                    }
                }
                if(RoleIdNew != -1){
                    let key = "users"
                    let post = ["password":pwd,"Role":RoleNew,"RoleId":RoleIdNew,"phone":phone,"email":email    ] as [String : Any]
                    databaseRef.child(key).child(self.userNameOutlet.text!).setValue(post)
                    
                    
                    popUp(popUpMessage: "Successfully updated password!", popUpTitle:"Reset Password!" , viewName: self,addActionflag: 1)
                }else{
                    popUp(popUpMessage: "UserName doesn't exist in database, Please verify!", popUpTitle:"Reset Password!" , viewName: self,addActionflag: 0)
                    
                    return
                }
               
            }
            
            
            
        }else{
            popUp(popUpMessage: "Confirm Password and New Password should be the same!", popUpTitle: "Reset Password!", viewName: self,addActionflag: 0)
        }
        
        
    }
    
    @IBAction func emailEditingChanged(_ sender: Any) {
        
        if newPassword.text?.isEmpty == true || confirmPassword.text?.isEmpty == true || userNameOutlet.text?.isEmpty == true
        {
            resetPwdBtnOutlet.isEnabled = false
        }
        else
        {
            resetPwdBtnOutlet.isEnabled = true
        }
    }
    
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
        
    }
    
    
  
    

}
