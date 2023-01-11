//
//  BidViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 02/05/22.
//

import UIKit

class BidViewController: UIViewController {

    var bidAmount = 9999999999
    
    var bids = NSDictionary()
    var bidDetails:[String] = []
    
    @IBOutlet weak var bidAmountOutlet: UILabel!
    
    @IBOutlet weak var ContracteeName: UILabel!
    
    @IBOutlet weak var ContracteePhone: UILabel!
    
    @IBOutlet weak var ContracteeEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
        //fetchData()
        
        bidAmountOutlet.text! = "Bid Amount: 100000$"
        
        ContracteeName.text! = "Contractee Name: Lokesh"
        
        ContracteePhone.text! = "Contractee Phone: 6601231232"
        ContracteeEmail.text! = "Contractee Email: lokesh@gmail.com"
    }
    
    func fetchData(){
        
        databaseRef.child("Contract").child(self.title!).child("Bid").observeSingleEvent(of: .value) { snapshot in
            if(snapshot.exists()){
                self.bids = snapshot.value as! NSDictionary
                //self.bidDetails = self.bids as! [String,Any]
                
                
                for(key,value) in self.bids{
                  //  print(key,value)
                
                }
                
            }
        
    }

}
}
