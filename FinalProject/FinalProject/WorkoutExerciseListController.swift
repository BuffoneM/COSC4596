//
//  NewWorkoutController.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-12-02.
//

import Foundation
import UIKit

class WorkoutExerciseListController : UITableViewController {
    
    let workouts:[Workout] = []
    var newWorkoutName:String?
    let newWorkout: Workout = Workout()
    let workoutStorage:WorkoutStorage = WorkoutStorage()
    
    @IBOutlet weak var newWorkoutNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newWorkoutNameLabel.text = newWorkoutName
        newWorkout.workoutName = newWorkoutName!
        
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    @IBAction func addExercise(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setViewController = mainStoryboard.instantiateViewController(withIdentifier: "CreateNewWorkoutExerciseController") as! CreateNewWorkoutExerciseController
        
        setViewController.workoutItem = newWorkout
        navigationController?.pushViewController(setViewController, animated: true)
        
    }
    
  
    
    

    @IBAction func saveWorkout(_ sender: Any) {
        workoutStorage.appendWorkout(newWorkout)
        workoutStorage.saveToFile()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension WorkoutExerciseListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the list size, not a hardcoded value
        return newWorkout.exerciseList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseItem2", for: indexPath)

        let item = newWorkout.exerciseList[indexPath.row]
        configureText(for: cell, with: item.exerciseName)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = newWorkout.exerciseList[indexPath.row]
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func configureText(for cell: UITableViewCell, with item: String) {
        let label = cell.viewWithTag(100) as! UILabel
        label.text = item
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}

