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



class NutritionVC: UIViewController {
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
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    @IBOutlet weak var servingSizeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
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
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let foodInfo = FoodInfo(context: contex)
        foodInfo.itemName = (info?.itemName)!
        foodInfo.servingSizeUnit = (info?.servingSizeUnit)!
        foodInfo.servingSizQty = (info?.servingSizQty)!
        foodInfo.calcium = info?.calcium ?? -1
        foodInfo.calories = (info?.calories)!
        foodInfo.caloriesFromFat = info?.caloriesFromFat ?? -1
        foodInfo.cholesterol = info?.cholesterol ?? -1
        foodInfo.dietaryFiber = info?.dietaryFiber ?? -1
        foodInfo.iron = info?.iron ?? -1
        foodInfo.monounsaturatedFat = info?.monounsaturatedFat ?? -1
        foodInfo.polyunsaturatedFat = info?.polyunsaturatedFat ?? -1
        foodInfo.protein = (info?.protein)!
        foodInfo.saturatedFat = info?.saturatedFat ?? -1
        foodInfo.sodium = info?.sodium ?? -1
        foodInfo.sugars = info?.sugars ?? -1
        foodInfo.totalCarbohydrate = (info?.totalCarbohydrate)!
        foodInfo.totalFat = info?.totalFat ?? -1
        foodInfo.transFat = info?.transFat ?? -1
        foodInfo.vitaminA = info?.vitaminA ?? -1
        foodInfo.vitaminC = info?.vitaminC ?? -1
        try? contex.save()
        
        self.displayAlert(title: "Food Is Saved ", message: "")
        saveButton.isEnabled = false
    }
    
    
    @IBAction func IEatThis(_ sender: Any) {
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
extension NutritionVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entitis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionCell")!
        let textLabel = entitis[indexPath.row]
        cell.textLabel?.text = textLabel
        let detailTextLabel = "\(values[indexPath.row])"
        if detailTextLabel == "nil"{
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
