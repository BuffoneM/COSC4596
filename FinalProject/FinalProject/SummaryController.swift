//
//  SummaryController.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-12-01.
//

import Foundation
import UIKit


class SummaryController : UIViewController {
    
    var workout:Workout?
    var processedArray:[Exercise]?
    
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let globalDuration = TimeConversion.convertSec((workout?.totalDuration)!)
        durationLabel.text = TimeConversion.timeLabelString(globalDuration.0, globalDuration.1, globalDuration.2)
        
        var summaryString = "Here's your summary. \n\n"
        
        for item in (processedArray)! {
            if !item.isExerciseBreak{
                let time = TimeConversion.convertSec(item.time)
                summaryString.append(item.exerciseName + "\n")
                summaryString.append(TimeConversion.timeLabelString(time.0, time.1, time.2) + "\n\n")
            }

        }
        
        summaryLabel.text = summaryString
    }
    
    @IBAction func endWorkoutPress(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated:true)
    }

}
