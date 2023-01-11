//
//  joinNowViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 05/04/22.
//

import UIKit
import FirebaseDatabase

class JoinNowViewController: UIViewController {

    @IBOutlet weak var signUpBtnOutlet: UIButton!
    
    
    @IBOutlet weak var bidderContracterBtn: UIButton!
    
    @IBOutlet weak var userNameOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var emailOutlet: UITextField!
    
    @IBOutlet weak var phoneOutlet: UITextField!
    
    var databaseRef:DatabaseReference = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopupButton()

        // Do any additional setup after loading the view.
        self.title = "Join us"

            signUpBtnOutlet.isEnabled = false


    }
    
    func setPopupButton(){
        
        let optionClosure = {(action : UIAction) in
            
        //print(action.title)
            
        }
        bidderContracterBtn.menu = UIMenu(children : [
        UIAction(title : "Contractee", state : .on, handler: optionClosure),
        UIAction(title : "Contractor", state : .on, handler: optionClosure)])
        
        bidderContracterBtn.showsMenuAsPrimaryAction = true
        bidderContracterBtn.changesSelectionAsPrimaryAction = true
        
    }
    

  
    @IBAction func signUpBtnClicked(_ sender: Any) {
    
        var roleId = -1;
        let roleName = bidderContracterBtn.currentTitle!.lowercased()
        
      //  print(roleName)
        if(roleName == "contractor"){
            roleId = 2
        }else if(roleName == "contractee"){
            roleId = 1
        }else{
            roleId = 0
        }
        
        // for register
        let key = "users"
        let post = ["Role":bidderContracterBtn.currentTitle!,"RoleId":roleId,"password":passwordOutlet.text!,"email":emailOutlet.text!,"phone":phoneOutlet.text!] as [String : Any]
        databaseRef.child(key).child(userNameOutlet.text!).setValue(post)
        
//        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        self.show(secondVC, sender: self)
        
        let alert = UIAlertController(title: "Success!", message: "Your profile has been created!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in
            self.dismiss(animated: true, completion: nil)
                }
        alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
       
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func phoneEditingChanged(_ sender: Any) {
        
        if phoneOutlet.text!.isEmpty
        {
            signUpBtnOutlet.isEnabled = false
        }
        else
        {
            signUpBtnOutlet.isEnabled = true
        }

    }
    
}
