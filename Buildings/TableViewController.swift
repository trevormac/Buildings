//
//  TableViewController.swift
//  Buildings
//
//  Created by Trevor MacGregor on 2017-05-30.
//  Copyright © 2017 TeevoCo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //pins are added to the map then rows are added to the tableview
    override func viewDidLoad() {
        super.viewDidLoad()
        //let our view know that the pins are coming in from the background thread
        NotificationCenter.default.addObserver(forName: BuildingsController.BUILDING_ADDED_NOTIFICATION, object: nil, queue: nil) { notification in
            self.tableView.reloadData()
        }
    }
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BuildingsController.sharedBuildings().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let buildingsArray:Array = BuildingsController.sharedBuildings()
        let building:MapPin = buildingsArray[indexPath.row] as! MapPin
        cell.textLabel?.text = building.title
        return cell
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
}
