//
//  Utility.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 30/04/22.
//

import Foundation
import UIKit
import FirebaseDatabase

var databaseRef:DatabaseReference = Database.database().reference()

var globalUserName = ""

func popUp(popUpMessage:String,popUpTitle:String,viewName:UIViewController,addActionflag:Int){
   
    let alert = UIAlertController(title: popUpTitle, message: popUpMessage, preferredStyle: UIAlertController.Style.alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
    {_ in
        
        if(addActionflag == 1){
            viewName.dismiss(animated: true, completion: nil)
        }else if (addActionflag == 2){
            
            _ = viewName.navigationController?.popViewController(animated: true)
        }
    }
    
    alert.addAction(okAction)
    viewName.present(alert, animated: true, completion: nil)
}
