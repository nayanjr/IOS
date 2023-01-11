//
//  ContracteeViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 05/04/22.
//

import UIKit
import FirebaseDatabase

class ContracteeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contracts = NSDictionary()
    var contractData:[String] = []
    
    
    @IBOutlet weak var ContracteeTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUp(popUpMessage: "You are logged in as Contractor!", popUpTitle: "Welcome \(globalUserName) !", viewName: self, addActionflag: 5)
        
        ContracteeTableViewOutlet.delegate = self
        ContracteeTableViewOutlet.dataSource = self
        
        self.title = "Contracts"
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //fetchData()
        ContracteeTableViewOutlet.reloadData()
    }
        
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)
    {
    }

    
    func fetchData()
    {
        databaseRef.child("Contract").observeSingleEvent(of: .value) { snapshot in
            
            if(snapshot.exists()){
                self.contracts = snapshot.value as! NSDictionary
                self.contractData = self.contracts.allKeys as! [String]
            }
            
        }
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contractData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContracteeTableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contractData[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let transition = segue.identifier
        
        if transition == "contracteeDetailsSegue"{
            let destination = segue.destination as! ContracteeDetailsViewController
            
//            destination.count = "\((ContracteeTableViewOutlet.indexPathForSelectedRow?.row)!)"
            
            destination.count = (ContracteeTableViewOutlet.indexPathForSelectedRow?.row)!
            let contractClicked = contractData[(ContracteeTableViewOutlet.indexPathForSelectedRow?.row)!]
                            destination.name = contractClicked
            for (key, value) in self.contracts{
                                if key as! String == contractClicked{
                                    for (key1, value1) in value as! [String:Any]{
                                        if key1 == "ContractDesc"{
                                            destination.desc = value1 as! String
                                        }
                                        else if key1 == "ContractType"{
                                            destination.type = value1 as! String
                                        }
                                    }
                                }
                            }
        }
        
        
    }
    
    
    @IBAction func refreshBtnClicked(_ sender: Any) {
        
        fetchData()
        ContracteeTableViewOutlet.reloadData()
    }
    
    
    
}
