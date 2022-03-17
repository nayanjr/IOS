//
//  ViewController.swift
//  CoordinateSystemsDemo
//
//  Created by Karaturi,Kamal Nayan on 3/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let minX = imageView.frame.minX
        let minY = imageView.frame.minY
        print("\(minX),\(minY)");
        
        let maxX = imageView.frame.maxX
        let maxY = imageView.frame.maxY
        print("\(maxX),\(maxY)");
        
        let midX = imageView.frame.midX
        let midY = imageView.frame.midY
        print("\(midX),\(midY)");
        
        //top left
        imageView.frame.origin.x = 0
        imageView.frame.origin.y = 0
        //top right
        imageView.frame.origin.x = 314
        imageView.frame.origin.y = 0
        //bottom left
        imageView.frame.origin.x = 0
        imageView.frame.origin.y = 796
        //bottom right
        imageView.frame.origin.x = 314
        imageView.frame.origin.y = 796
        //center
        imageView.frame.origin.x = 157
        imageView.frame.origin.y = 398
        
    }


}

