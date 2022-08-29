//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()


    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSliderr: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
       
        
        let heightValue = String(format: "%.2f", sender.value)
        
        print(heightLabel.text = "\(heightValue)m")
        

        
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        
        
        let weightValue = String(format: "%.0f", sender.value)
        print(weightLabel.text = "\(weightValue)kg")
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        let height = Float(heightSlider.value)
        let weight = Float(weightSliderr.value)
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
    
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.userBMI = calculatorBrain.getBMI()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        
    }
    
    }
}

