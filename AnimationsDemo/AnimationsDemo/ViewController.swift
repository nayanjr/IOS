//
//  ViewController.swift
//  AnimationsDemo
//
//  Created by Karaturi,Kamal Nayan on 3/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    @IBOutlet weak var happyOutlet: UIButton!
    
    @IBOutlet weak var sadOutlet: UIButton!
    
    
    @IBOutlet weak var angryOutlet: UIButton!
    
    @IBOutlet weak var shakemeOutlet: UIButton!
    
    @IBOutlet weak var showOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Mover all the components outside the safe area/screen
        imageOutlet.image = UIImage(named:"hello")
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imageOutlet.frame.origin.x=view.frame.width
        happyOutlet.frame.origin.x=view.frame.width
        sadOutlet.frame.origin.x=view.frame.width
        angryOutlet.frame.origin.x=view.frame.width
        shakemeOutlet.frame.origin.x=view.frame.width
        
        
    }
    
    
    @IBAction func happyButtonClicked(_ sender: UIButton) {
        
        animateImage(_imageName:"happy")
    }
    
    @IBAction func sadButtonClicked(_ sender: UIButton) {
        
        animateImage(_imageName:"sad")
    }
    
    @IBAction func angryButtonClicked(_ sender: UIButton) {
        
        animateImage(_imageName:"angry")
    }
    
    @IBAction func shakeMeButtonClicked(_ sender: UIButton) {
        
        
        var w = imageOutlet.frame.width
        w += 40
        
        var h = imageOutlet.frame.height
        h += 40
        
        var x = imageOutlet.frame.origin.x
        x -= 20
        
        var y = imageOutlet.frame.origin.y
        y -= 20
        
       if w>=200 && h>=200
      {
          w = imageOutlet.frame.width
          h = imageOutlet.frame.height
      }
            
            
        
        var largerFrame = CGRect(x: x,y: y,width: w, height: h)
        UIView.animate(withDuration: 1, delay:0,usingSpringWithDamping: 0.2,initialSpringVelocity: 0, animations: {
            self.imageOutlet.frame = largerFrame
        })
    }
    
    @IBAction func showButtonClicked(_ sender: UIButton) {
       // imageOutlet.frame.origin.x=view.frame.
        
        UIView.animate(withDuration: 1, animations:{
            self.imageOutlet.center.x=self.view.center.x
            self.happyOutlet.center.x=self.view.center.x
            self.sadOutlet.center.x=self.view.center.x
            self.angryOutlet.center.x=self.view.center.x
            self.shakemeOutlet.center.x=self.view.center.x
            self.showOutlet.isEnabled = false
        })
        
        
        
    }
    
    func animateImage(_imageName:String)
    {
        UIView.animate(withDuration: 1, animations: {
            self.imageOutlet.alpha = 0
        })
        
        UIView.animate(withDuration: 1,  animations: {
            
            self.imageOutlet.alpha = 1
            self.imageOutlet.image = UIImage(named:_imageName)
            
        })
       
    }
    
    
}

