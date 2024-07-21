//
//  DetailsNutritionViewController.swift
//  FitnessTrackerApp
//
//  Created by Varun Kumar Singh on 21/07/24.
//

import UIKit

import UIKit

class DetailsNutritionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedData: String?
    var nutritionDetails: [(nutrition: String, notes: String)] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var DataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = selectedData { DataLabel.text = data }
        
        self.title = "Nutrition Diet Details"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        // Register the custom cell
        let nib = UINib(nibName: "NutritionDetailCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NutritionDetailCell")
        
        // Add navigation bar buttons
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNutritionDetail))
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMain))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func addNutritionDetail() {
        let alert = UIAlertController(title: "Add Nutrition Detail", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Nutrition"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Notes"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let nutrition = alert.textFields?[0].text, let notes = alert.textFields?[1].text {
                self?.nutritionDetails.append((nutrition: nutrition, notes: notes))
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
        return nutritionDetails.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionDetailCell", for: indexPath) as! NutritionDetailCell
        let detail = nutritionDetails[indexPath.row]
        cell.nutritionLabel.text = detail.nutrition
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

