//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Eddy Gonzalez on 8/26/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
//    var height: Float
//    var Weight: Float
    
    
    mutating func calculateBMI(height: Float, weight: Float) {

        let bmiValue = ((weight / (height * height)))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a Fiddle", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        }
        
    }
    
    
    func getBMI() -> String{
        let bmiDecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiDecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advicce"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.green
    }
    
}
