//
//  NewWorkoutController.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-12-02.
//

import Foundation
import UIKit

class NewWorkoutController : UIViewController{
    
    @IBOutlet weak var newWorkoutNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension NewWorkoutController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? WorkoutExerciseListController else { return }
        
        vc.newWorkoutName = newWorkoutNameTextField.text!
    }
    
    
}
