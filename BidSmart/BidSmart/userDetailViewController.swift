//
//  userDetailViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 01/05/22.
//

import UIKit

class userDetailViewController: UIViewController {

    @IBOutlet weak var userNameTextOutlet: UITextField!
    
    @IBOutlet weak var passwordTextOutlet: UITextField!
    
    @IBOutlet weak var roleTextOutlet: UITextField!
    
    
    @IBOutlet weak var emaillTextOutlet: UITextField!
    
    
    @IBOutlet weak var phoneTextOutlet: UITextField!
    
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    @IBOutlet weak var editBtnOutlet: UIButton!
    
    
    @IBOutlet weak var deleteBtnOutlet: UIButton!
    
    
    @IBOutlet weak var discardBtnOutlet: UIButton!
    
    
    var uName = ""
    var password = ""
    var role = ""
    var email = ""
    var phone = ""
    
    var initialuName = ""
    var initialpassword = ""
    var initialrole = ""
    var initialemail = ""
    var initialphone = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        saveBtnOutlet.isHidden = true
        discardBtnOutlet.isHidden = true
        
        updateui()
        self.title = "Update User Name Details"
        disableTextFields()
        
        initialuName = userNameTextOutlet.text!
        initialpassword = passwordTextOutlet.text!
        initialrole = roleTextOutlet.text!
        initialemail = emaillTextOutlet.text!
        initialphone = phoneTextOutlet.text!
         
         userNameTextOutlet.isEnabled = false
        
        
    }
    
    func updateui ()
    {
        userNameTextOutlet.text = uName
        passwordTextOutlet.text = password
        roleTextOutlet.text = role
        emaillTextOutlet.text = email
        phoneTextOutlet.text = phone
        
    }
    
    
    func enableTextFields(){
        
        passwordTextOutlet.isEnabled = true
        roleTextOutlet.isEnabled = true
        emaillTextOutlet.isEnabled = true
        phoneTextOutlet.isEnabled = true
        
    }
    
    func disableTextFields(){
       
        passwordTextOutlet.isEnabled = false
        roleTextOutlet.isEnabled = false
        emaillTextOutlet.isEnabled = false
        phoneTextOutlet.isEnabled = false
    }
    

    @IBAction func saveBtnAction(_ sender: Any) {
        
        let key = "users"
        let post = ["Role":roleTextOutlet.text!,"password":passwordTextOutlet.text!] as [String : Any]
        databaseRef.child(key).child(userNameTextOutlet.text!).setValue(post)
        
        
        
        disableTextFields()
        saveBtnOutlet.isHidden = true
        discardBtnOutlet.isHidden = true
        editBtnOutlet.isHidden = false
        deleteBtnOutlet.isHidden = false
        
        let alert = UIAlertController(title: "Success!", message: "User details have been updated!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in
            _ = self.navigationController?.popViewController(animated: true)
                }
        alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func editBtnAction(_ sender: Any) {
        
        enableTextFields()
        saveBtnOutlet.isHidden = false
        discardBtnOutlet.isHidden = false
        editBtnOutlet.isHidden = true
        deleteBtnOutlet.isHidden = true
    }
    
    @IBAction func deleteBtnAction(_ sender: Any) {
        
       // print(initialuName)
        
        databaseRef.child("users").child(initialuName).removeValue { error, _ in
                
            }
        
        popUp(popUpMessage: "User has been deleted!", popUpTitle:"Success!" , viewName: self,addActionflag: 2)
        
        
        
        
    }
    
    
    @IBAction func discardBtnAction(_ sender: Any) {
        
        disableTextFields()
        passwordTextOutlet.text = initialpassword
        roleTextOutlet.text = initialrole
        emaillTextOutlet.text = initialemail
        phoneTextOutlet.text = initialphone
    
        saveBtnOutlet.isHidden = true
        discardBtnOutlet.isHidden = true
        editBtnOutlet.isHidden = false
        deleteBtnOutlet.isHidden = false
    }
    
    
}
