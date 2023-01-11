//
//  ViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 05/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ImageOutlet.image = UIImage(named: "homelogo")
    }

    
//    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
//    {
//        
//    }
    

}

