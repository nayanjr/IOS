//
//  ContracteeDetailsViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 05/04/22.
//

import UIKit
import FirebaseDatabase

class ContracteeDetailsViewController: UIViewController {
    
    var contracts = NSDictionary()
    var contractData:[String] = []
    
    var databaseRef:DatabaseReference = Database.database().reference()
    
    @IBOutlet weak var projectNameTextField: UITextField!
   
    @IBOutlet weak var typeTextField: UITextField!
    
    @IBOutlet weak var bidEndDateTextField: UITextField!
    
    @IBOutlet weak var statusTextField: UITextField!
    
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    @IBOutlet weak var editBtnOutlet: UIButton!
    
    @IBOutlet weak var deleteBtnOutlet: UIButton!
    
    @IBOutlet weak var DiscardBtnOutlet: UIButton!
    
    var contractDetails = [["Contract1","Residential","28-04-2022","Open"],["Contract2","Commercial","28-05-2022","Open"],["Contract3","Residential","28-05-2022","Open"]]

    @IBOutlet weak var contracteeDetailsOutlet: UILabel!
    
    var count = 0
    var name = ""
    var desc = ""
    var type = ""
    
    var initialPName = ""
    var initialPType = ""
    var initialDate = ""
    var initialStatus = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        contracteeDetailsOutlet.text! = count
        
        updateui(count)
        self.title = "\(name) details"
        saveBtnOutlet.isHidden = true
        DiscardBtnOutlet.isHidden = true
        
       disableTextFields()
        
        initialPName = projectNameTextField.text!
        initialPType = typeTextField.text!
        initialDate = bidEndDateTextField.text!
        initialStatus = statusTextField.text!
        
        projectNameTextField.isEnabled = false
        
     
    }
    
    func updateui (_ count: Int)
    {
        projectNameTextField.text = name
        typeTextField.text = type
        bidEndDateTextField.text = contractDetails[0][2]
        statusTextField.text = desc
        
    }
    
    func enableTextFields(){
        
        typeTextField.isEnabled = true
        bidEndDateTextField.isEnabled = true
        statusTextField.isEnabled = true
        
    }
    
    func disableTextFields(){
       
        typeTextField.isEnabled = false
        bidEndDateTextField.isEnabled = false
        statusTextField.isEnabled = false
        
    }
    

    @IBAction func placeBidBtnClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
        let key = "Contract"
        let post = ["ContractDesc":projectNameTextField.text!,"ContractType":typeTextField.text!] as [String : Any]
        databaseRef.child(key).child(projectNameTextField.text!).setValue(post)
        
        
        
        disableTextFields()
        saveBtnOutlet.isHidden = true
        DiscardBtnOutlet.isHidden = true
        editBtnOutlet.isHidden = false
        deleteBtnOutlet.isHidden = false
        
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
        
        enableTextFields()
        saveBtnOutlet.isHidden = false
        DiscardBtnOutlet.isHidden = false
        editBtnOutlet.isHidden = true
        deleteBtnOutlet.isHidden = true
    }
    
    
    @IBAction func deleteBtnAction(_ sender: Any) {
        
        databaseRef.child("Contract").child(initialPName).removeValue { error, _ in
                
            }
        
        let alert = UIAlertController(title: "Success!", message: "Contract has been deleted!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in
            _ = self.navigationController?.popViewController(animated: true)
                }
        alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func discardBtnAction(_ sender: Any) {
        
        disableTextFields()
        typeTextField.text! = initialPType
        bidEndDateTextField.text! = initialDate
        statusTextField.text! = initialStatus
    
        saveBtnOutlet.isHidden = true
        DiscardBtnOutlet.isHidden = true
        editBtnOutlet.isHidden = false
        deleteBtnOutlet.isHidden = false
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let transition = segue.identifier
        
        if transition == "BidViewSegue"{
            let destination = segue.destination as! BidViewController
            
            destination.title = projectNameTextField.text!
        }
    }
    
    
}
