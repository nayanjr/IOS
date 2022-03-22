//
//  ResultViewController.swift
//  DiscountMultiMVC
//
//  Created by Karaturi,Kamal Nayan on 3/22/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var enteredAmtOutlet: UILabel!
    @IBOutlet weak var enteredDiscOutlet: UILabel!
    @IBOutlet weak var DiscountOutlet: UILabel!
    
    var amount = ""
    var discRate = ""
    var priceAfterDisc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        enteredAmtOutlet.text = enteredAmtOutlet.text! + amount
        enteredDiscOutlet.text = enteredDiscOutlet.text! + discRate
        DiscountOutlet.text = DiscountOutlet.text! + priceAfterDisc
        
    }
    


}
