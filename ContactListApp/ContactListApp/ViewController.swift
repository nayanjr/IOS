//
//  ViewController.swift
//  ContactListApp
//
//  Created by Karaturi,Kamal Nayan on 4/19/22.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var contactNames : [String] = []
    var selection = 0

    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        fetchData()
        
        //print(contactNames)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
   return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell
        
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        //populate a cell
        
       cell.textLabel?.text = contactNames[indexPath.row]
        
        //return a cell
        
        return cell
    }
    
    
    func fetchData(){
        
        // create a reference
        
        let databaseRef = Database.database().reference()
        
        databaseRef.observeSingleEvent(of: .value) { snapshot in
            let contacts = snapshot.value as! NSDictionary
            
        self.contactNames = contacts.allKeys as! [String]
            
//            self.contactNames = contacts.value(forKey: contactsTableView.indexPathForSelectedRow?.row)!
            
            //reload the data
            self.contactsTableView.reloadData()
        }
        
        
       
    }


}

