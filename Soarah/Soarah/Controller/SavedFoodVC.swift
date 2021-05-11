//
//  SavedFood.swift
//  Soarah
//
//  Created by khalid alhazmi on 08/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SavedFoodVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var resultControoler: NSFetchedResultsController<FoodInfo>!
    var contex: NSManagedObjectContext{return DataController.shared.viewContex}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupResultControoler()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resultControoler = nil
    }
    
    
    func setupResultControoler() {
        let fetchRequst: NSFetchRequest<FoodInfo> = FoodInfo.fetchRequest()
        fetchRequst.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        
        resultControoler = NSFetchedResultsController(fetchRequest: fetchRequst, managedObjectContext: contex, sectionNameKeyPath: nil, cacheName: nil)
        
        resultControoler.delegate = self
        
        do {
            try resultControoler.performFetch()
            tableView.reloadData()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    
    
}
extension SavedFoodVC:  UITableViewDelegate, UITableViewDataSource{
    //MARK: TableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numOfItems = resultControoler.fetchedObjects?.count ?? 0
        
        return numOfItems
        //return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell


        let food = resultControoler.object(at: indexPath)

        cell.foodNameLabel.text = food.itemName
        
        var servingSizeUnitText = "\(String(describing: food.servingSizeUnit))"
        
        servingSizeUnitText = servingSizeUnitText.replacingOccurrences(of: "Optional(\"", with: "")
        servingSizeUnitText = servingSizeUnitText.replacingOccurrences(of: "\")", with: "")
        
        cell.sevingLabel.text = "\(food.servingSizQty) \(servingSizeUnitText)"
        
        cell.numOfCalLabel.text = "\(food.calories)"

        return cell
    }
 
    //MARK: TableViewDelgate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = resultControoler.object(at: indexPath)
        
        let itemInfo = ItemInfo(itemName: food.itemName, servingSizQty: food.servingSizQty, servingSizeUnit: food.servingSizeUnit, calories: food.calories, caloriesFromFat: food.caloriesFromFat, totalFat: food.totalFat, saturatedFat: food.saturatedFat, monounsaturatedFat: food.monounsaturatedFat, polyunsaturatedFat: food.polyunsaturatedFat, transFat: food.transFat, cholesterol: food.cholesterol, sodium: food.sodium, totalCarbohydrate: food.totalCarbohydrate, dietaryFiber: food.dietaryFiber, sugars: food.sugars, protein: food.protein, vitaminA: food.vitaminA, vitaminC: food.vitaminC, calcium: food.calcium, iron: food.iron)
        
        FoodModel.foodInfo = itemInfo
        self.performSegue(withIdentifier: "toSavedNutritionVC", sender: self)
    }

}
