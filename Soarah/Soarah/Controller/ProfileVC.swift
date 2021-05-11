//
//  ProfileVC.swift
//  Soarah
//
//  Created by khalid alhazmi on 08/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation
import UIKit

class ProfileVC: UIViewController {
    // MARK: Stander Value
    let Name = "Name"
    let Gender = "Gender"
    let Age = "Age"
    let Tall = "Tall"
    let Weight = "Weight"
    let Caloris = "Caloris"
    let Carbs =   "Carbs"
    let Protien = "Protien"
    let Fat =  "Fat"
    
    let CalorisByDay = "CalorisByDay"
    let CarbsByDay = "CarbsByDay"
    let ProtienByDay = "ProtienByDay"
    let FatByDay = "FatByDay"
    
 
    //info
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    //Daily
    @IBOutlet weak var caloriesDayilyLabel: UILabel!
    
    @IBOutlet weak var carbsDailyLabel: UILabel!
    
    @IBOutlet weak var proteinDailyLabel: UILabel!
    
    @IBOutlet weak var FatsDailyLabel: UILabel!
    //byday
    @IBOutlet weak var caloriesByDayLabel: UILabel!
    
    @IBOutlet weak var carbsByDayLabel: UILabel!
    
    @IBOutlet weak var proteinByDayLabel: UILabel!
    
    @IBOutlet weak var FatsByDayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if FirstLaunch(){
            performSegue(withIdentifier: "towelecomePage", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpValues()
    }
    
    
    
    func setUpValues()  {
        let name = UserDefaults.standard.string(forKey: Name)
        let age = UserDefaults.standard.integer(forKey: Age)
        let caloris = UserDefaults.standard.integer(forKey: Caloris)
        let carbs = UserDefaults.standard.integer(forKey: Carbs)
        let protien = UserDefaults.standard.integer(forKey: Protien)
        let fat = UserDefaults.standard.integer(forKey: Fat)
        
      
        let calorisByDay = UserDefaults.standard.integer(forKey: CalorisByDay)
        let carbsByDay = UserDefaults.standard.integer(forKey: CarbsByDay)
        let protienByDay = UserDefaults.standard.integer(forKey: ProtienByDay)
        let fatByDay = UserDefaults.standard.integer(forKey: FatByDay)
        
        nameLabel.text = name
        ageLabel.text = "Age: \(age)"
        
        caloriesDayilyLabel.text = "\(caloris)🔥"
        carbsDailyLabel.text = "\(carbs)g"
        proteinDailyLabel.text = "\(protien)g"
        FatsDailyLabel.text = "\(fat)g"
        
        caloriesByDayLabel.text = "\(calorisByDay)🔥"
        carbsByDayLabel.text = "\(carbsByDay)g"
        proteinByDayLabel.text = "\(protienByDay)g"
        FatsByDayLabel.text = "\(fatByDay)g"
        
        
        
    }
    
    func FirstLaunch() -> Bool {
        if UserDefaults.standard.bool(forKey: "HasLaunchedBefore") {
            return false
        }
        return true
    }
    
}
