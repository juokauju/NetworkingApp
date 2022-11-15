//
//  ViewController.swift
//  NordSwitchTaskApp
//
//  Created by Justina siaulyte on 2022-11-15.
//

import UIKit

class TableViewController: UITableViewController {
    
    let networkRequest = NetworkRequest()
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.items = self.networkRequest.execute() ?? []
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

