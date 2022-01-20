//
//  ViewController.swift
//  HelloApp
//
//  Created by Karaturi,Kamal Nayan on 1/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UITextField!
    
    
    @IBOutlet weak var gradeOutlet: UITextField!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonClicked(_ sender: Any) {
        var name=nameOutlet.text!
        var grade=gradeOutlet.text!
        
        displayLabel.text="Hello, \(name) , Your grade is \(grade)!"
        
    }
    
}

