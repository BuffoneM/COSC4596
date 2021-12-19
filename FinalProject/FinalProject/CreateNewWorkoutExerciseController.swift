//
//  CreateNewWorkoutExerciseController.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-12-02.
// https://codewithchris.com/uipickerview-example/
//

import Foundation
import UIKit

class CreateNewWorkoutExerciseController : UIViewController{
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var breakSwitch: UISwitch!
    @IBOutlet weak var newExerciseTextField: UITextField!
    @IBOutlet weak var setAmountTextField: UITextField!
    @IBOutlet weak var repAmountTextField: UITextField!
    @IBOutlet weak var restTimeTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var workoutItem: Workout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func breakSwitchFlip(_ sender: Any) {
        if(breakSwitch.isOn) {
            label1.text = "Break duration"
            label2.isHidden = true
            label3.isHidden = true
            label4.isHidden = true
            setAmountTextField.isHidden = true
            repAmountTextField.isHidden = true
            restTimeTextField.isHidden = true
        
        }
        else {
            label1.text = "Exercise Name"
            label2.isHidden = false
            label3.isHidden = false
            label4.isHidden = false
            setAmountTextField.isHidden = false
            repAmountTextField.isHidden = false
            restTimeTextField.isHidden = false
        }
    }
    
    @IBAction func savePress(_ sender: Any) {
        if((newExerciseTextField.text != "" && setAmountTextField.text != "" && repAmountTextField.text != "" && restTimeTextField.text != "") || (breakSwitch.isOn && newExerciseTextField.text != "")) {

            let newExercise: Exercise?

            let newExerciseText = (newExerciseTextField.text)!

            if(breakSwitch.isOn) {
                newExercise = Exercise(true, Int(newExerciseText)!)
            }
            else{
                newExercise = Exercise(newExerciseText, (Int((repAmountTextField.text)!))!, Int((setAmountTextField.text)!)!, Int((restTimeTextField.text)!)!)
            }
            workoutItem?.exerciseList.append(newExercise!)
            
            
        }
        
        navigationController?.popViewController(animated:true)

    }
}
