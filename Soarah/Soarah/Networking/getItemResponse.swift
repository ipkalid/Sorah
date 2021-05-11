// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getSearchResponse = try? newJSONDecoder().decode(GetSearchResponse.self, from: jsonData)

import Foundation

// MARK: - GetSearchResponse
struct getItemResponse: Codable {
    
    let itemID, itemName: String
    let nfCalories, nfCaloriesFromFat, nfTotalFat: Double?
    let nfSaturatedFat, nfTransFattyAcid, nfPolyunsaturatedFat, nfMonounsaturatedFat: Double?
    let nfCholesterol, nfSodium, nfTotalCarbohydrate: Double?
    let nfDietaryFiber: Double?
    let nfSugars, nfProtein, nfVitaminADv: Double?
    let nfVitaminCDv: Double?
    let nfCalciumDv, nfIronDv: Double?
    let nfServingSizeQty: Double
    let nfServingSizeUnit: String
    
    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case itemName = "item_name"
        case nfCalories = "nf_calories"
        case nfCaloriesFromFat = "nf_calories_from_fat"
        case nfTotalFat = "nf_total_fat"
        case nfSaturatedFat = "nf_saturated_fat"
        case nfTransFattyAcid = "nf_trans_fatty_acid"
        case nfPolyunsaturatedFat = "nf_polyunsaturated_fat"
        case nfMonounsaturatedFat = "nf_monounsaturated_fat"
        case nfCholesterol = "nf_cholesterol"
        case nfSodium = "nf_sodium"
        case nfTotalCarbohydrate = "nf_total_carbohydrate"
        case nfDietaryFiber = "nf_dietary_fiber"
        case nfSugars = "nf_sugars"
        case nfProtein = "nf_protein"
        case nfVitaminADv = "nf_vitamin_a_dv"
        case nfVitaminCDv = "nf_vitamin_c_dv"
        case nfCalciumDv = "nf_calcium_dv"
        case nfIronDv = "nf_iron_dv"
        case nfServingSizeQty = "nf_serving_size_qty"
        case nfServingSizeUnit = "nf_serving_size_unit"
    }
    
}



