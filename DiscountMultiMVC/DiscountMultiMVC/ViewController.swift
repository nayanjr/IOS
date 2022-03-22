//
//  ViewController.swift
//  DiscountMultiMVC
//
//  Created by Karaturi,Kamal Nayan on 3/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AmountOutlet: UITextField!
    @IBOutlet weak var DiscountOutlet: UITextField!
    
    var PriceAfterDisc = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AmountOutlet.text = ""
        DiscountOutlet.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        AmountOutlet.text = ""
        DiscountOutlet.text = ""
        
    }
    
    


    @IBAction func CalculateDiscountBtnClicked(_ sender: UIButton) {
        
        var amount = Double(AmountOutlet.text!)
        var DiscRate = Double(DiscountOutlet.text!)
        
        
        PriceAfterDisc = amount!-(amount!*DiscRate!/100)
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "resultSegway"{
            var destination = segue.destination as!
            ResultViewController
            
            destination.amount = AmountOutlet.text!
            destination.discRate = DiscountOutlet.text!
            destination.priceAfterDisc = String (PriceAfterDisc)
        }
    }
}

