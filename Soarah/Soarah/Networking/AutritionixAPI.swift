//
//  AutritionixAPI.swift
//  Soarah
//
//  Created by khalid alhazmi on 07/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation

import Foundation
import MapKit

class AutritionixAPI {
    
   
    
    static let appId = "6b2a23f4";
    static let appKey = "1b339a0bac58eaac065248d82d5dc624"
    static let results = "0%3A10"
    static let fields = "item_name%2Cnf_serving_size_unit%2Cnf_serving_size_qty%2Cnf_calories"
    enum Endpoints {
        
        static let base = "https://api.nutritionix.com/v1_1/"
        
        case getSearchResults
        case getItemResults
        
        var stringValue: (String){
            switch self {
                case .getSearchResults:
                    return Endpoints.base + "search/{phrase}?results=\(AutritionixAPI.results)&fields=\(AutritionixAPI.fields)&appId=\(AutritionixAPI.appId)&appKey=\(AutritionixAPI.appKey)"
                    
                    
                case .getItemResults:
                    return Endpoints.base + "item?id={id}&appId=\(AutritionixAPI.appId)&appKey=\(AutritionixAPI.appKey)"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    
    
    class func getSearchResults(with phrase: String, completion: @escaping ([FoodSearchEntintis], Error?) -> Void) {
        let baseURL = Endpoints.getSearchResults.stringValue
        let newPhrase = phrase.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let URLStringValue = baseURL.replacingOccurrences(of: "{phrase}", with: newPhrase)
        //if let
        if let url: URL = URL(string: URLStringValue){
            NutritionixAPIHelper.taskForGETRequest(url: url, responseType: GetSearchResponse.self) {
                (response, error) in

                if let response = response {
                    var items: [FoodSearchEntintis] = []
                    for item in response.hits{
                        let newItem = FoodSearchEntintis(itemID: item.id,
                                                     itemName: item.fields.itemName,
                                                     calories: item.fields.nfCalories,
                                                     servingSizQty: item.fields.nfServingSizeQty,
                                                     servingSizeUnit: item.fields.nfServingSizeUnit )
                        items.append(newItem)
                    }
                    completion(items, nil)
                } else{
                    completion([], error)
                }
            }
        }
    }
    
    class func getItemData(with itemID: String, completion: @escaping (ItemInfo?, Error?) -> Void) {
        let baseURL = Endpoints.getItemResults.stringValue
        let URLStringValue = baseURL.replacingOccurrences(of: "{id}", with: itemID)
        let url: URL = URL(string: URLStringValue)!
        NutritionixAPIHelper.taskForGETRequest(url: url, responseType: getItemResponse.self) { (response, error) in
            if let response = response {
                let itemInfo: ItemInfo
                itemInfo = ItemInfo(itemName: response.itemName,
                         servingSizQty: response.nfServingSizeQty,
                         servingSizeUnit: response.nfServingSizeUnit,
                         calories: response.nfCalories,
                         caloriesFromFat: response.nfCaloriesFromFat,
                         totalFat: response.nfTotalFat,
                         saturatedFat: response.nfSaturatedFat,
                         monounsaturatedFat: response.nfMonounsaturatedFat,
                         polyunsaturatedFat: response.nfPolyunsaturatedFat,
                         transFat: response.nfTransFattyAcid,
                         cholesterol: response.nfCholesterol,
                         sodium: response.nfSodium,
                         totalCarbohydrate: response.nfTotalCarbohydrate,
                         dietaryFiber: response.nfDietaryFiber,
                         sugars: response.nfSugars,
                         protein: response.nfProtein,
                         vitaminA: response.nfVitaminADv,
                         vitaminC: response.nfVitaminCDv,
                         calcium: response.nfCalciumDv,
                         iron: response.nfIronDv)
                completion(itemInfo, nil)
            }else{
                completion(nil, error)
                print(error!)
            }
            
        }
      
    }
 
}

