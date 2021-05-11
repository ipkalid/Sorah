//
//  DataEntryVC.swift
//  Soarah
//
//  Created by khalid alhazmi on 10/07/2019.
//  Copyright © 2019 khalid alhazmi. All rights reserved.
//

import Foundation
import UIKit
class DataEntryVC: UIViewController {
    
    // MARK: Stander Value
    let Name = "Name"
    let Gender = "Gender"
    let Age = "Age"
    let Tall = "Tall"
    let Weight = "Weight"
    
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var tall: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    
    var gendervalue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        if FirstLaunch(){
            return
        }
        
          nameLabel.text  = UserDefaults.standard.string(forKey: Name)
          age.text = "\(UserDefaults.standard.integer(forKey: Age))"
          weight.text = "\(UserDefaults.standard.integer(forKey: Weight))"
          tall.text = "\(UserDefaults.standard.integer(forKey: Tall))"
          gendervalue = UserDefaults.standard.integer(forKey: Gender)
          gender.selectedSegmentIndex = UserDefaults.standard.integer(forKey: Gender)
        

        
        
    }
    
    
    func FirstLaunch() -> Bool {
        if UserDefaults.standard.bool(forKey: "HasLaunchedBefore") {
            return false
        }
        return true
    }
    
    
    
    @IBAction func genderPressed(_ sender: Any) {
        switch gender.selectedSegmentIndex
        {
        case 0://Male
            gendervalue = 0
        case 1://Female
            gendervalue = 1
        default:
            gendervalue = 0
        }
        print(gendervalue)
    }
    
    
    
    @IBAction func buttomtabbed(_ sender: Any) {
        if !nameLabel.text!.isEmpty && !age.text!.isEmpty && !weight.text!.isEmpty && !tall.text!.isEmpty{
            
            print(gendervalue)
            
            let agevalue = Int(age.text!)
            let tallvalue = Int(tall.text!)
            let weighvatlue = Int(weight.text!)
            
            var caloris = 0
            
            if gendervalue == 1 {//Male
                let firstPart = 10 * weighvatlue!
                let secondPart = 6 * tallvalue!
                let thirdPart = 5 * agevalue!
                caloris = firstPart + secondPart - thirdPart - 150

                }
            else{//Female
                let firstPart = 10 * weighvatlue!
                let secondPart = 6 * tallvalue!
                let thirdPart = 5 * agevalue!
                caloris = firstPart + secondPart - thirdPart + 30
                }
            
            UserDefaults.standard.set(caloris, forKey: "Caloris")
            
            let carbs = Int(Double(caloris) * 0.5 * 0.25)
            let protien = Int(Double(caloris) * 0.25 * 0.25)
            let fat = Int(Double(caloris) * 0.25 * 0.125)
            
            UserDefaults.standard.set(nameLabel.text, forKey: "Name")
            UserDefaults.standard.set(gendervalue, forKey: "Gender")
            
            UserDefaults.standard.set(agevalue, forKey: "Age")
            UserDefaults.standard.set(tallvalue, forKey: "Tall")
            UserDefaults.standard.set(weighvatlue, forKey: "Weight")
            
            UserDefaults.standard.set(caloris, forKey: "Caloris")
            UserDefaults.standard.set(carbs, forKey: "Carbs")
            UserDefaults.standard.set(protien, forKey: "Protien")
            UserDefaults.standard.set(fat, forKey: "Fat")
            
            UserDefaults.standard.set(0, forKey: "CalorisByDay")
            UserDefaults.standard.set(0, forKey: "CarbsByDay")
            UserDefaults.standard.set(0, forKey: "ProtienByDay")
            UserDefaults.standard.set(0, forKey: "FatByDay")
            
            UserDefaults.standard.set(true, forKey: "HasLaunchedBefore")
            

            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.displayAlert(title: "Enter the Data", message: "Enter the Data first then you can go")
            
        }
        
    }
    
}

    


