//
//  nutritionixAPIHelper.swift
//  Soarah
//
//  Created by khalid alhazmi on 07/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation
class NutritionixAPIHelper {
    
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { (data, respone, error) in
            if let error = error{
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }else{
                let decoder = JSONDecoder()
                //let JSONString = String(data: data!, encoding: String.Encoding.utf8)
                //print(JSONString!)
                do {
                    let responseObject = try decoder.decode(ResponseType.self, from: data!)
                    DispatchQueue.main.async {
                        completion(responseObject, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil,error)
                    }
                }
            }
        }
        task.resume()
        return task
    }
}

