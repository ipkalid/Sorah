//
//  NutritionixResponse.swift.swift
//  Soarah
//
//  Created by khalid alhazmi on 07/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getSearchResponse = try? newJSONDecoder().decode(GetSearchResponse.self, from: jsonData)

import Foundation

// MARK: - GetSearchResponse
struct GetSearchResponse: Codable {
    let totalHits: Int
    let maxScore: Double
    let hits: [Hit]
    
    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
        case maxScore = "max_score"
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    let index: String
    let type: TypeEnum
    let id: String
    let score: Double
    let fields: Fields
    
    enum CodingKeys: String, CodingKey {
        case index = "_index"
        case type = "_type"
        case id = "_id"
        case score = "_score"
        case fields
    }
}

// MARK: - Fields
struct Fields: Codable {
    let itemName: String
    let nfCalories: Double
    let nfServingSizeQty: Double
    let nfServingSizeUnit: String
    let nfServingWeightGrams: Double?
    
    enum CodingKeys: String, CodingKey {
        case itemName = "item_name"
        case nfCalories = "nf_calories"
        case nfServingSizeQty = "nf_serving_size_qty"
        case nfServingSizeUnit = "nf_serving_size_unit"
        case nfServingWeightGrams = "nf_serving_weight_grams"
    }
}

enum TypeEnum: String, Codable {
    case item = "item"
}
