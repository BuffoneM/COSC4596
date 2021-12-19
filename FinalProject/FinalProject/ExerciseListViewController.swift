//
//  ExcerciseListViewController.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-11-24.
//

import Foundation
import UIKit

class ExerciseListViewController: UITableViewController {
    
    var workoutItem:Workout?
    var items:[Exercise]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = workoutItem?.exerciseList
        
    }
    
    @IBAction func btnBack() {
            navigationController?.popViewController(animated: true)
    }
}

extension ExerciseListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (workoutItem?.exerciseList.count == 0) {
            let alert = UIAlertController(title: "Empty Workout", message: "There are no exercises in this workout.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        guard let vc = segue.destination as? TimerViewController else { return }
        vc.workoutItem = workoutItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the list size, not a hardcoded value
        return items!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseItem2", for: indexPath)

        let item = items![indexPath.row]
        configureText(for: cell, with: item.exerciseName)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items![indexPath.row]
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func configureText(for cell: UITableViewCell, with item: String) {
        let label = cell.viewWithTag(69) as! UILabel
        label.text = item
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    

}
