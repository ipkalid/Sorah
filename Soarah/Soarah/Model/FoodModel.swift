//
//  SearchModel.swift
//  Soarah
//
//  Created by khalid alhazmi on 07/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation

class FoodModel {
    
    static var searchItems = [FoodSearchEntintis]()
    static var foodInfo: ItemInfo?
    
    
}

struct FoodSearchEntintis : Codable{
    let itemID: String
    let itemName: String
    let calories: Double
    let servingSizQty: Double
    let servingSizeUnit: String
    
}
struct ItemInfo : Codable{
    let itemName: String?
    let servingSizQty: Double?
    let servingSizeUnit: String?
    let calories: Double?
    let caloriesFromFat: Double?
    let totalFat: Double?
    let saturatedFat: Double?
    let monounsaturatedFat: Double?
    let polyunsaturatedFat: Double?
    let transFat: Double?
    let cholesterol: Double?
    let sodium: Double?
    let totalCarbohydrate: Double?
    let dietaryFiber: Double?
    let sugars: Double?
    let protein: Double?
    let vitaminA: Double?
    let vitaminC: Double?
    let calcium: Double?
    let iron: Double?
}
