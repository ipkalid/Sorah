//
//  FoodInfoExtention.swift
//  Soarah
//
//  Created by khalid alhazmi on 09/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation

extension FoodInfo{
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
