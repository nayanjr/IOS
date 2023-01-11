//
//  AdminViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 01/05/22.
//

import UIKit


class AdminViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    

    
    @IBOutlet weak var AdminTableView: UITableView!
    var users = NSDictionary()
    var userData:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        popUp(popUpMessage: "You are logged in as Admin", popUpTitle: "Welcome \(globalUserName) !", viewName: self, addActionflag: 5)
        
        AdminTableView.delegate = self
        AdminTableView.dataSource = self
        fetchData()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
        AdminTableView.reloadData()
    }
    
    
    func fetchData()
    {
        databaseRef.child("users").observeSingleEvent(of: .value) { snapshot in
            
            if(snapshot.exists()){
                self.users = snapshot.value as! NSDictionary
                self.userData = self.users.allKeys as! [String]
            }
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AdminTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = userData[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let transition = segue.identifier
        
        if transition == "userDetailSegue"{
            let destination = segue.destination as! userDetailViewController
            
            
         //   destination.count = (AdminTableView.indexPathForSelectedRow?.row)!
            
            
            let contractClicked = userData[(AdminTableView.indexPathForSelectedRow?.row)!]
                            destination.uName = contractClicked
            for (key, value) in self.users{
                                if key as! String == contractClicked{
                                    for (key1, value1) in value as! [String:Any]{
                                        if key1 == "Role"{
                                            destination.role = value1 as! String
                                        }
                                        else if key1 == "password"{
                                            destination.password = value1 as! String
                                        }
                                        else if key1 == "email"{
                                            destination.email = value1 as! String
                                        }
                                        else if key1 == "phone"{
                                            destination.phone = value1 as! String
                                        }
                                    }
                                }
                            }
        }
        
        
    }
    
    
    
    @IBAction func refreshBtnAction(_ sender: Any) {
        
        fetchData()
        AdminTableView.reloadData()
    }
    

}
