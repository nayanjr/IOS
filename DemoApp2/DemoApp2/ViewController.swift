//
//  ViewController.swift
//  DemoApp2
//
//  Created by Karaturi,Kamal Nayan on 1/25/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayText: UITextField!
    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        
                var name=displayText.text!
        name=name.uppercased()
        
        
                
        if(
            name.contains("A") ||
             name.contains("E") ||
         name.contains("I") ||
            name.contains("O") ||
         name.contains("U"))  {
                
                displayLabel.text="The text has vowel"
        
    }
        
        else {
            displayLabel.text = "No vowels Found"
        }
    
    }
    
}



