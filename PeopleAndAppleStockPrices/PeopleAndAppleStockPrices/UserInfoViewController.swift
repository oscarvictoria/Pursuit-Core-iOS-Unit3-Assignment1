//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
    
    var user = [PeopleData]() {
        didSet {
            tableView.reloadData()
        }
    }
    

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    loadData()
    
  }
    func loadData() {
        user = People.getUsers()
    }

}

extension UserInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let users = user[indexPath.row]
        cell.textLabel?.text = ("\(users.name["first"]?.capitalized ?? "") \(users.name["last"]?.capitalized ?? "")")

        return cell
    }
}
