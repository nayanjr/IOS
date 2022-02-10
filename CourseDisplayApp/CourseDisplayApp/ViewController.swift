//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by Karaturi,Kamal Nayan on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var courseNum: UILabel!
    
    @IBOutlet weak var courseTitle: UILabel!
    
    @IBOutlet weak var courseSem: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    let courses = [["img01","44555","Network Security","Fall 2021"],["img02","44643","Data Streaming","Fall 2022"],["img03","44656","IOS","Fall 2022"]]
    
    var imageNumber = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //The details of the course in index 0 is displayed and previous button is disbaled
        
        updateUI(imageNumber)
        prevButton.isEnabled = false
    }
    
    
    
    @IBAction func prevButtonClicked(_ sender: UIButton) {
        imageNumber -= 1
        updateUI(imageNumber)
        nextButton.isEnabled = true
        
        if(imageNumber == 0){
            prevButton.isEnabled = false
        }
        
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        imageNumber += 1
        updateUI(imageNumber)
        prevButton.isEnabled = true
        
        if(imageNumber == courses.count-1){
            nextButton.isEnabled = false
        }
            
        
    }
    
    func updateUI(_ imageNum : Int){
        
        displayImage.image = UIImage(named: courses[imageNum][0] )
        courseNum.text = courses[imageNum][1]
        courseTitle.text = courses[imageNum][2]
        courseSem.text = courses[imageNum][3]
        
    }
}

