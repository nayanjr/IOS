//
//  ViewController.swift
//  classroom
//
//  Created by Karaturi,Kamal Nayan on 2/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textOutlet: UITextField!
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        let a = Int(textOutlet.text!)
        
        if((a!)%2 == 0)
        {
            labelOutlet.text="Number \(a!) is even"
        }
        else
        {
            labelOutlet.text="Number \(a!) is odd"
        }
        
}

}
