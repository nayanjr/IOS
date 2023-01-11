//
//  ContractorViewController.swift
//  BidSmart
//
//  Created by Kamal Karaturi on 01/05/22.
//

import UIKit

class ContractorViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var contracts = NSDictionary()
    var contractData:[String] = []
    
    var contractsOpen = NSDictionary()
    var contractDataOpen:[String] = []
    
    


    @IBOutlet weak var contractorTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUp(popUpMessage: "You are logged in as Contractee!", popUpTitle: "Welcome \(globalUserName) !", viewName: self, addActionflag: 5)

        // Do any additional setup after loading the view.
        contractorTableView.delegate = self
        contractorTableView.dataSource = self
        fetchData()
        contractorTableView.reloadData()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //fetchData()
        contractorTableView.reloadData()
    }
    
//contractorCell
    
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
        let cell = contractorTableView.dequeueReusableCell(withIdentifier: "contractorCell", for: indexPath)
        cell.textLabel?.text = contractData[indexPath.row]
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let transition = segue.identifier
        
        if transition == "contractorDetailsSegue"{
            let destination = segue.destination as! ContractorDetailsViewController

            let contractClicked = contractData[(contractorTableView.indexPathForSelectedRow?.row)!]
                            destination.cName = contractClicked
            for (key, value) in self.contracts{
                                if key as! String == contractClicked{
                                    for (key1, value1) in value as! [String:Any]{
                                        if key1 == "ContractDesc"{
                                            destination.cType = value1 as! String
                                        }
                                        else if key1 == "ContractType"{
                                            destination.cDesc = value1 as! String
                                        }
                                        else if key1 == "Bid Closed Date"{
                                            destination.cDate = value1 as! String
                                        }
                                    }
                                }
                            }
        }
        
        
    }
    

    

}
