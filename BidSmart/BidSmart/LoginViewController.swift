//
//  LoginViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 05/04/22.
//

import UIKit
import FirebaseDatabase



class LoginViewController: UIViewController {
    
    var users = NSDictionary()
    var userData:[String] = []

    @IBOutlet weak var userNameOutlet: UITextField!
    
    
    @IBOutlet weak var passwordOutlet: UITextField!
    

    
    @IBOutlet weak var signInBtnOutlet: UIButton!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // databaseRef =
        // Do any additional setup after loading the view.
        
        signInBtnOutlet.isEnabled = false
        self.title = "Login"
        
        
    }
        
    func fetchData(){
        
        
    }
    
    @IBAction func signInBtnClickAction(_ sender: Any) {
        
        globalUserName = ""
        let userName = userNameOutlet.text!
        let password = passwordOutlet.text!
        var checkedpwdFlag = false
        var checkedContractorRole = false
        var checkedContracteeRole = false
        var checkedAdminRole = false
        
        databaseRef.child("users").child(userName).observeSingleEvent(of: .value) { snapshot in
            
            
            if(snapshot.exists()){
                self.users = snapshot.value as! NSDictionary
                for (key, value) in self.users{
                        
                    if(key as! String == "RoleId"){
                        if(value as! Int == 2){
                            checkedContractorRole = true
                        }else if(value as! Int == 3){
                            checkedAdminRole = true
                        }else{
                            checkedContracteeRole = true
                        }
                    }
                    
                    if(key as! String == "password"){
                        if(value as! String == password){
                            checkedpwdFlag = true
                        }
                    }
                }
               // print(checkedAdminRole,checkedContracteeRole,checkedContractorRole)
                if checkedpwdFlag {
                    if(checkedContractorRole){
                        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "ContracteeViewController") as! ContracteeViewController
                        self.show(secondVC, sender: self)
                    }else if(checkedAdminRole){
                        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
                        self.show(secondVC, sender: self)
                    }else if(checkedContracteeRole){
                        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "ContractorViewController") as! ContractorViewController
                        self.show(secondVC, sender: self)
                    }
                    
                    globalUserName = userName
                    self.userNameOutlet.text! = ""
                    self.passwordOutlet.text! = ""
                    self.signInBtnOutlet.isEnabled = false
                }else{
                    popUp(popUpMessage: "Incorrect Username or Password, Please verify!", popUpTitle:"Incorrect Credentials!" , viewName: self,addActionflag: 0)
                }
            }else{
                popUp(popUpMessage: "Incorrect Username or Password, Please verify!", popUpTitle:"Incorrect Credentials!" , viewName: self,addActionflag: 0)
                
                self.userNameOutlet.text! = ""
                self.passwordOutlet.text! = ""
                self.signInBtnOutlet.isEnabled = false
            }
            
        }
        

       
    
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func passwordEditingChanged(_ sender: Any) {
        
        
        if passwordOutlet.text?.isEmpty == true || userNameOutlet.text?.isEmpty == true
        {
            signInBtnOutlet.isEnabled = false
        }
        else
        {
            signInBtnOutlet.isEnabled = true
        }
        

        
    }
    
}
