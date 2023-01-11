//
//  ContractorDetailsViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 01/05/22.
//

import UIKit

class ContractorDetailsViewController: UIViewController {

    @IBOutlet weak var infoLabelOutlet: UILabel!
    
    
    @IBOutlet weak var contractNameOutlet: UITextField!
    
    
    @IBOutlet weak var contractTypeOutlet: UITextField!
    
    @IBOutlet weak var contractDescOutlet: UITextField!
    
    
    @IBOutlet weak var contractDateOutlet: UITextField!
    
    
    @IBOutlet weak var bidAmountOutlet: UITextField!
    
    @IBOutlet weak var placeBidOutlet: UIButton!
    var cName = ""
    var cType = ""
    var cDesc = ""
    var cDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

 

        
        contractNameOutlet.text! = cName
        contractTypeOutlet.text! = cType
        contractDescOutlet.text! = cDesc
        contractDateOutlet.text! = cDate
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM-dd-yyyy"


        let date: NSDate? = dateFormatterGet.date(from: "\(cDate)") as NSDate?
        
        let date2 = NSDate()
        
        if date?.compare(date2 as Date) == .orderedAscending
        {
            placeBidOutlet.isEnabled = false
            infoLabelOutlet.text! = "Place Bid is disabled as Bid End Date has passed."
        }
        
        else
        {
            placeBidOutlet.isEnabled = true
        }
        
    

        
        
    }
    


    @IBAction func placeBidAction(_ sender: Any) {
        
        if bidAmountOutlet.text!.isEmpty
        {
            popUp(popUpMessage: "Please enter proper Bid amount!", popUpTitle: "Bid Amount", viewName: self, addActionflag: 5)
        }else{
          //  print(globalUserName)
            let post = ["Bid Amount":bidAmountOutlet.text!] as [String : Any]
            databaseRef.child("Contract").child(cName).child("Bid").child(globalUserName).setValue(post)
            popUp(popUpMessage: "Your Bid registered successfully!", popUpTitle: "Success", viewName: self, addActionflag: 2)
        }
    }
    
}
