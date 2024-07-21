//
//  DetailViewController.swift
//  FitnessTrackerApp
//
//  Created by Varun Kumar Singh on 21/07/24.
//

import UIKit



class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedData: String?
    var workoutDetails: [(workout: String, notes: String)] = []
   
    
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        if let data = selectedData { dataLabel.text = data }
        
            self.title = "Workout Details"
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        // Regiter the cudtom cell
        let nib = UINib(nibName: "WorkoutDetailCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WorkoutDetailCell")
            
            // Add navigation bar buttons
            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkoutDetail))
            let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMain))
            navigationItem.rightBarButtonItem = addButton
            navigationItem.leftBarButtonItem = backButton
        }
        
        @objc func addWorkoutDetail() {
            let alert = UIAlertController(title: "Add Workout Detail", message: nil, preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Workout"
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Notes"
            }
            let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
                if let workout = alert.textFields?[0].text, let notes = alert.textFields?[1].text {
                    self?.workoutDetails.append((workout: workout, notes: notes))
                    self?.tableView.reloadData()
                }
            }
            alert.addAction(addAction)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        @objc func backToMain() {
            navigationController?.popViewController(animated: true)
        }
        
        // UITableViewDataSource methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return workoutDetails.count
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutDetailCell", for: indexPath) as! WorkoutDetailCell
            let detail = workoutDetails[indexPath.row]
            cell.workoutLabel.text = detail.workout
            cell.notesLabel.text = detail.notes
            return cell
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


