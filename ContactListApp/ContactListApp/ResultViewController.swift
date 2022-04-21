//
//  ResultViewController.swift
//  ContactListApp
//
//  Created by Karaturi,Kamal Nayan on 4/21/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var phoneNumOutlet: UILabel!
    
    @IBOutlet weak var emailOutlet: UILabel!
    
    var phoneNum = 0
       var email = ""
    var name = ""
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           self.title = name
           phoneNumOutlet.text = "\(phoneNum)"
           emailOutlet.text = email
        // Do any additional setup after loading the view.
    }
    
}
