//
//  SearchVC.swift
//  Soarah
//
//  Created by khalid alhazmi on 08/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation
import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    
    
    
}
extension SearchVC:  UITableViewDelegate, UITableViewDataSource{
    //MARK: TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FoodModel.searchItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
    
        
        let food = FoodModel.searchItems[indexPath.row]
        
        cell.foodNameLabel.text = food.itemName
        cell.sevingLabel.text = "\(food.servingSizQty) \(food.servingSizeUnit)"
        cell.numOfCalLabel.text = "\(food.calories)"
        
        return cell
    }
    
    //MARK: TableViewDelgate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let itemID = FoodModel.searchItems[indexPath.row].itemID
        AutritionixAPI.getItemData(with: itemID) { (itemInfo, error) in
            if let error = error {
                self.displayAlert(title: "No Internet", message: error.localizedDescription)
                print(error.localizedDescription)
            }else{
                FoodModel.foodInfo = itemInfo

                self.performSegue(withIdentifier: "toNutritionVC", sender: self)
                
            }
        }
    }
    
}
extension SearchVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchBar.text!
        AutritionixAPI.getSearchResults(with: searchText) { (foods, error) in
            if let error = error {
                self.displayAlert(title: "No Internet", message: error.localizedDescription)
                print(error.localizedDescription)
            }else{
                    FoodModel.searchItems = foods
                    self.tableView.reloadData()
            }
        }
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        FoodModel.searchItems = []
        tableView.reloadData()
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
