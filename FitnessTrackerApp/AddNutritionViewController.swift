//
//  AddNutritionViewController.swift
//  FitnessTrackerApp
//
//  Created by Varun Kumar Singh on 21/07/24.
//

import UIKit


protocol AddNutritionDelegate: AnyObject {
    func didAddNutrition(_ nutrition: String)
}

class AddNutritionViewController: UIViewController {
    
    @IBOutlet weak var nutritionTextField: UITextField!
    weak var delegate: AddNutritionDelegate?
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        if let nutrition = nutritionTextField.text, !nutrition.isEmpty {
            delegate?.didAddNutrition(nutrition)
            self.navigationController?.popViewController(animated: true)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
