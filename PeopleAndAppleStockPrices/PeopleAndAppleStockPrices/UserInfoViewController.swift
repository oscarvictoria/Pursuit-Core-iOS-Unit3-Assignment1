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
@IBOutlet weak var searchBar: UISearchBar!
    
    var user = [PeopleData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    searchBar.delegate = self
    loadData()
//    sortNames()
    
  }
    func loadData() {
        user = People.getUsers().sorted{$0.name.fullName < $1.name.fullName}
    }
    
    func sortNames() {
    
    }
    
    
    
 func filterNames(for searchText: String) {
        guard !searchText.isEmpty else { return }
    user = People.getUsers().filter{$0.name.fullName.lowercased().contains(searchText.lowercased())}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDVC = segue.destination as? UserInfoDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("error")
        }
        
        let someUser = user[indexPath.row]
        userDVC.updatedUserInfo = someUser
    }

}

extension UserInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let users = user[indexPath.row]
//        let fullName = users.name.first + " " + users.name.last
        cell.textLabel?.text = users.name.fullName.capitalized
        cell.detailTextLabel?.text = "\(users.location.city.capitalized), \(users.location.state.capitalized)"

        return cell
    }
}

extension UserInfoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text else { return }
        filterNames(for: searchText)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
                   loadData()
                   return
               }
        
    }
}
