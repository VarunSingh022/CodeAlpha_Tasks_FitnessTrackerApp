//
//  AddWorkoutViewController.swift
//  FitnessTrackerApp
//
//  Created by Varun Kumar Singh on 21/07/24.
//

import UIKit

protocol AddWorkoutDelegate: AnyObject {
    func didAddWorkout(_ workout: String)
}

class AddWorkoutViewController: UIViewController {
    
    @IBOutlet weak var workoutTextField: UITextField!
    weak var delegate: AddWorkoutDelegate?
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        if let workout = workoutTextField.text, !workout.isEmpty {
            delegate?.didAddWorkout(workout)
            self.navigationController?.popViewController(animated: true)
        }
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


