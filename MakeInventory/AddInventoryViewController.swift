//
//  AddInventoryViewController.swift
//  MakeInventory
//
//  Created by Eliel A. Gordon on 11/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class AddInventoryViewController: UIViewController {
    let coreDataStack = CoreDataStack.instance
    
    @IBOutlet weak var inventoryNameField: UITextField!
    @IBOutlet weak var inventoryQuantityField: UITextField!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.inventoryNameField.text = "add inventory item"
//        self.inventoryQuantityField.text = "add total"
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let name = inventoryNameField.text, let quantity = Int64(inventoryQuantityField.text!) else {return}
        
        // set the date property
        // update the tableView
        let date = Date()
        
        
        let inv = Inventory(
            context: coreDataStack.privateContext
        )
        
        print("Date: \(date)\n")
        
        inv.name = name
        inv.quantity = quantity
        inv.date = date
        
        print("inv.Date: \(String(describing: inv.date))\n")
        
        coreDataStack.saveTo(context: coreDataStack.privateContext)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
