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
    var contacts = NSDictionary()

    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        self.title = "Contacts"
        
        fetchData()
        
        
        for _ in contactNames
        {
            print(contactNames)
        }
        
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
                    self.contacts = snapshot.value as! NSDictionary
                    self.contactNames = self.contacts.allKeys as! [String]
                    self.contactsTableView.reloadData();
            
            print(self.contacts)
        }
        
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let transistion = segue.identifier
            if transistion == "contactSegue"{
                let destination = segue.destination as! ResultViewController
                let contactClicked = contactNames[(contactsTableView.indexPathForSelectedRow?.row)!]
                destination.name = contactClicked
                for (key, value) in self.contacts{
                    if key as! String == contactClicked{
                        for (key1, value1) in value as! [String:Any]{
                            if key1 == "Email"{
                                destination.email = value1 as! String
                            }
                            else if key1 == "PhoneNumber"{
                                destination.phoneNum = value1 as! Int
                            }
                        }
                    }
                    print(key)//String
                    print(value)//Dictionary
                }
                


}

    }
}
