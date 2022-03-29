//
//  ViewController.swift
//  tableViewDemoTool
//
//  Created by Karaturi,Kamal Nayan on 3/29/22.
//

import UIKit

class AppleProducts{
    var productName : String?
    var productCategory : String?
    init(productName: String,productCategory: String){
        self.productName = productName
        self.productCategory = productCategory
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "reusableCell",for:indexPath)
        
        cell.textLabel?.text = productsArray[indexPath.row].productName
        
        return cell;
    }
    
    var productsArray = [AppleProducts]()
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        let product1 = AppleProducts(productName: "MacBookAir", productCategory: "Laptop")
        productsArray.append(product1)
        
        let product2 = AppleProducts(productName: "Iphone", productCategory: "Mobile")
        productsArray.append(product2)
        
        let product3 = AppleProducts(productName: "Airpods", productCategory: "Accessory")
        productsArray.append(product3)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "detailsSegue"{
            let destination = segue.destination as! DetailsViewController
            
            destination.product = productsArray[(tableViewOutlet.indexPathForSelectedRow?.row)!]
        }
    }


}

