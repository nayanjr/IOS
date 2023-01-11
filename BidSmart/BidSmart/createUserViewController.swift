//
//  createUserViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 01/05/22.
//

import UIKit

class createUserViewController: UIViewController {

    @IBOutlet weak var uNameTextOutlet: UITextField!
    
    
    @IBOutlet weak var passwordTextOutlet: UITextField!
    

    @IBOutlet weak var roleTextOutlet: UITextField!
    
    
    @IBOutlet weak var roleIdTextOutlet: UITextField!
    
    
    @IBOutlet weak var emailTextOutlet: UITextField!
    
    @IBOutlet weak var phoneTextOutlet: UITextField!
    
    
    @IBOutlet weak var createBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createBtnOutlet.isEnabled = false
    }
    
    
    @IBAction func createBtnAction(_ sender: Any) {
        
        let key = "users"
        let post = ["password":passwordTextOutlet.text!,"Role":roleTextOutlet.text!,"RoleId":Int(roleIdTextOutlet.text!),"email":emailTextOutlet.text!,"phone":phoneTextOutlet.text!] as [String : Any]
        databaseRef.child(key).child(uNameTextOutlet.text!).setValue(post)
     
        
        popUp(popUpMessage: "User has been created!", popUpTitle:"Success!" , viewName: self,addActionflag: 2)
        
    }
    
    
    @IBAction func discardBtnAction(_ sender: Any) {
        uNameTextOutlet.text = ""
        passwordTextOutlet.text = ""
        roleTextOutlet.text = ""
        roleIdTextOutlet.text = ""
        emailTextOutlet.text = ""
        phoneTextOutlet.text = ""
        
    }
    
    
    @IBAction func phoneEditingChanged(_ sender: Any) {

        if uNameTextOutlet.text?.isEmpty == true || passwordTextOutlet.text?.isEmpty == true || roleTextOutlet.text?.isEmpty == true || roleIdTextOutlet.text?.isEmpty == true || emailTextOutlet.text?.isEmpty == true || phoneTextOutlet.text?.isEmpty == true
        {
            createBtnOutlet.isEnabled = false
        }
        else
        {
            createBtnOutlet.isEnabled = true
        }
        
        
    }
    
    

}
