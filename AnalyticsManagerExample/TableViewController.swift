//
//  TableViewController.swift
//  AnalyticsManagerExample
//
//  Created by Sjoerd Janssen on 02/07/2018.
//  Copyright © 2018 Sjoerd Janssen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("test1")
        let logger = LogAnalyticsEngine()
        let manager = AnalyticsManager(engines: [logger, logger])
        manager.logPurchase(price: 12.50,
                            currency: "eur",
                            success: true,
                            itemName: "Black Dumpert Shirt",
                            itemType: "shirt",
                            itemId: "1234abcd",
                            attributes: ["test1": "test2", "test3": "test4"])
    }
}
