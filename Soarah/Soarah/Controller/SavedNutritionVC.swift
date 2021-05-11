//
//  NutritionVC.swift
//  Soarah
//
//  Created by khalid alhazmi on 09/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation
import CoreData
import UIKit



class SavedNutritionVC: UIViewController {
    //MARK: Default Value
    let CalorisByDay = "CalorisByDay"
    let CarbsByDay = "CarbsByDay"
    let ProtienByDay = "ProtienByDay"
    let FatByDay = "FatByDay"
    let info = FoodModel.foodInfo
    
    var resultControoler: NSFetchedResultsController<FoodInfo>!
    
    var contex: NSManagedObjectContext{
        return DataController.shared.viewContex
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var servingSizeLabel: UILabel!

    
    let entitis: [String] = ["Calories",
                             "Calories From Fat",
                             "Total Fat",
                             "      Saturated Fat",
                             "      Trans Fat",
                             "      Polyunsaturated Fat",
                             "      Monounsaturated Fat",
                             "Cholesterol",
                             "Sodium",
                             "Total Carbohydrate",
                             "      Dietary Fiber",
                             "      Sugars",
                             "Protein",
                             "Vitamin A",
                             "Vitamin C",
                             "Calcium",
                             "Iron"]
    
    
    
    let values: [Any] = [FoodModel.foodInfo?.calories as Any,
                         FoodModel.foodInfo?.caloriesFromFat as Any,
                         FoodModel.foodInfo?.totalFat as Any,
                         FoodModel.foodInfo?.saturatedFat as Any,
                         FoodModel.foodInfo?.transFat as Any,
                         FoodModel.foodInfo?.polyunsaturatedFat as Any,
                         FoodModel.foodInfo?.monounsaturatedFat as Any,
                         FoodModel.foodInfo?.cholesterol as Any,
                         FoodModel.foodInfo?.sodium as Any,
                         FoodModel.foodInfo?.totalCarbohydrate as Any,
                         FoodModel.foodInfo?.dietaryFiber as Any,
                         FoodModel.foodInfo?.sugars as Any,
                         FoodModel.foodInfo?.protein as Any,
                         FoodModel.foodInfo?.vitaminA as Any,
                         FoodModel.foodInfo?.vitaminC as Any,
                         FoodModel.foodInfo?.calcium as Any,
                         FoodModel.foodInfo?.iron as Any]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        foodNameLabel.text = info?.itemName
        
        var servingSizeUnitText = "\(String(describing: info?.servingSizeUnit))"
        servingSizeUnitText = servingSizeUnitText.replacingOccurrences(of: "Optional(\"", with: "")
        servingSizeUnitText = servingSizeUnitText.replacingOccurrences(of: "\")", with: "")
        
        var servingSizeQtyText = "\(String(describing: info?.servingSizQty))"
        servingSizeQtyText = servingSizeQtyText.replacingOccurrences(of: "Optional(", with: "")
        servingSizeQtyText = servingSizeQtyText.replacingOccurrences(of: ")", with: "")
        
        servingSizeLabel.text = "\(servingSizeQtyText) \(servingSizeUnitText)"
    }
    
    
    @IBAction func IAteThis(_ sender: Any) {
        let oldCalorisByDay = UserDefaults.standard.integer(forKey: CalorisByDay)
        let newCalorisByDay = oldCalorisByDay + Int((info?.calories)!)
        UserDefaults.standard.set(newCalorisByDay, forKey: CalorisByDay)
        
        let oldCarbsByDay = UserDefaults.standard.integer(forKey: CarbsByDay)
        let newCarbsByDay = oldCarbsByDay + Int((info?.totalCarbohydrate)!)
        UserDefaults.standard.set(newCarbsByDay, forKey: CarbsByDay)
        
        let oldProtienByDay = UserDefaults.standard.integer(forKey: ProtienByDay)
        let newProtienByDay = oldProtienByDay + Int((info?.protein)!)
        UserDefaults.standard.set(newProtienByDay, forKey: ProtienByDay)
        
        let oldFatByDay = UserDefaults.standard.integer(forKey: FatByDay)
        let newFatByDay = oldFatByDay + Int((info?.totalFat)!)
        UserDefaults.standard.set(newFatByDay, forKey: FatByDay)
        
        self.displayAlert(title: "Nutrition Added", message: "")
        
    }
    
    
    

}
extension SavedNutritionVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entitis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionCell")!
        let textLabel = entitis[indexPath.row]
        cell.textLabel?.text = textLabel
        let detailTextLabel = "\(values[indexPath.row])"
        if detailTextLabel == "Optional(-1.0)"{
            cell.detailTextLabel!.text = "not Avalable"
            cell.detailTextLabel!.textColor = .red
            cell.selectionStyle = .none
            return cell
        }else{
            var text = detailTextLabel.replacingOccurrences(of: "Optional(", with: "")
            text = text.replacingOccurrences(of: ")", with: "")
            cell.detailTextLabel!.text = text
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    
}
