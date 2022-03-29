//
//  DetailsViewController.swift
//  tableViewDemoTool
//
//  Created by Karaturi,Kamal Nayan on 3/29/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var displayOutlet: UILabel!
    
    var product: AppleProducts?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayOutlet.text = "the product \((product?.productName)!) is of \((product?.productCategory)!) category"
    }
    

}
