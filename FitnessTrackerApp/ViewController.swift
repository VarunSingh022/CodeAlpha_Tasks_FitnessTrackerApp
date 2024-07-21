//
//  ViewController.swift
//  FitnessTrackerApp
//
//  Created by Varun Kumar Singh on 21/07/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var workoutPickerView: UIPickerView!
    @IBOutlet weak var nutritionPickerView: UIPickerView!
    
    var workoutData: [String] = []
    var nutritionData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutPickerView.delegate = self
        workoutPickerView.dataSource = self
        nutritionPickerView.delegate = self
        nutritionPickerView.dataSource = self
    }
    
    @IBAction func addWorkoutButtonClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addWorkoutVC = storyboard.instantiateViewController(withIdentifier: "AddWorkoutViewController") as? AddWorkoutViewController {
            addWorkoutVC.delegate = self
            self.navigationController?.pushViewController(addWorkoutVC, animated: true)
        }
    }
    
    @IBAction func addNutritionButtonClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addNutritionVC = storyboard.instantiateViewController(withIdentifier: "AddNutritionViewController") as? AddNutritionViewController {
            addNutritionVC.delegate = self
            self.navigationController?.pushViewController(addNutritionVC, animated: true)
        }
    }
    
    // UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == workoutPickerView {
            return workoutData.count
        } else {
            return nutritionData.count
        }
    }
    
    // UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == workoutPickerView {
            return workoutData[row]
        } else {
            return nutritionData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if pickerView == workoutPickerView {
            let selectedData = workoutData[row]
            if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                detailVC.selectedData = selectedData
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        } else {
            let selectedData = nutritionData[row]
            if let detailNutritionVC = storyboard.instantiateViewController(withIdentifier: "DetailsNutritionViewController") as? DetailsNutritionViewController {
                detailNutritionVC.selectedData = selectedData
                self.navigationController?.pushViewController(detailNutritionVC, animated: true)
            }
        }
    }
}

extension ViewController: AddWorkoutDelegate, AddNutritionDelegate {
    func didAddWorkout(_ workout: String) {
        workoutData.append(workout)
        workoutPickerView.reloadAllComponents()
    }
    
    func didAddNutrition(_ nutrition: String) {
        nutritionData.append(nutrition)
        nutritionPickerView.reloadAllComponents()
    }
}


