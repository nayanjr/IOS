//
//  createNewContractViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 05/04/22.
//

import UIKit
import FirebaseDatabase

class createNewContractViewController: UIViewController {
    
//    var databaseRef:DatabaseReference = Database.database().reference()
    
    @IBOutlet weak var contractNameOutlet: UITextField!
    
    @IBOutlet weak var contractDescOutlet: UITextField!
    
    
    @IBOutlet weak var popupButtonOutlet: UIButton!
    @IBOutlet weak var bidCloseDateOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Contract"
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        setPopupButton()
        
        bidCloseDateOutlet.inputView = datePicker
        bidCloseDateOutlet.text = formatDate(date: Date())
        
        
 

        // Do any additional setup after loading the view.
    }
    
    func setPopupButton(){
        
        let optionClosure = {(action : UIAction) in
            //print(action.title)
            
        }
    popupButtonOutlet.menu = UIMenu(children : [
        UIAction(title : "Residential", state : .on, handler: optionClosure),
        UIAction(title : "Commercial", state : .on, handler: optionClosure)])
        
        popupButtonOutlet.showsMenuAsPrimaryAction = true
        popupButtonOutlet.changesSelectionAsPrimaryAction = true
        
    }
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        bidCloseDateOutlet.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter.string(from: date)
    }

    
    @IBAction func createContractBtnClicked(_ sender: Any) {

        let key = "Contract"
        let post = ["ContractDesc":contractDescOutlet.text!,"ContractType":popupButtonOutlet.currentTitle!,"Bid Closed Date":bidCloseDateOutlet.text!] as [String : Any]
        databaseRef.child(key).child(contractNameOutlet.text!).setValue(post)
         
        let alert = UIAlertController(title: "Success!", message: "Contract has been created!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in
            self.dismiss(animated: true, completion: nil)
            
            
                }
        alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
        


    }
    
}
