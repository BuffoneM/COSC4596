//
//  ViewController.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-11-24.
//

import UIKit

class WorkoutListViewController: UITableViewController {

    var items = [Workout]()
    let workoutStorage:WorkoutStorage = WorkoutStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        items = WorkoutStorage.workouts
    
    }
    
    @IBAction func addItem() {
           let newRowIndex = items.count
           let item = Workout()
           
           items.append(item)
           let indexPath = IndexPath(row: newRowIndex, section: 0)
           let indexPaths = [indexPath]
           tableView.insertRows(at: indexPaths, with: .automatic)
       }

}

extension WorkoutListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the list size, not a hardcoded value
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutItem2", for: indexPath)
        
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let setViewController = mainStoryboard.instantiateViewController(withIdentifier: "ExerciseListViewController") as! ExerciseListViewController
            
            setViewController.workoutItem = item
            navigationController?.pushViewController(setViewController, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureText(for cell: UITableViewCell, with item: Workout) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.workoutName
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    

}

