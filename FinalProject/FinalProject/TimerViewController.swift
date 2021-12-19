//
//  TimerViewController.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-11-25.
//  Timer tutorial reference:
//  https://www.youtube.com/watch?v=3TbdoVhgQmE
//

import Foundation
import UIKit

class TimerViewController : UIViewController {
    
    var workoutItem:Workout?
    var processedArray:[Exercise] = []
    
    var exercises:[Exercise] = []
    var currExerciseIndex = 0
    
    @IBOutlet weak var globalTimerText: UILabel!
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var pauseStartButton: UIButton!
    
    @IBOutlet weak var btnPreviousExercise: UIButton!
    @IBOutlet weak var btnNextExercise: UIButton!
    
    @IBOutlet weak var workoutNameText: UILabel!
    @IBOutlet weak var exerciseText: UILabel!
    @IBOutlet weak var repText: UILabel!
    @IBOutlet weak var currSetText: UILabel!
    
    var timer:Timer = Timer()
    var globalTime:Int = 0
    var currTime:Int = 0
    var timerCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        processWorkoutArray()
        exercises = processedArray
        workoutNameText.text = workoutItem?.workoutName
        
        btnPreviousExercise.isEnabled = false
        updateTextLabels(exercises[0])
        
    }

    func processWorkoutArray(){
        for item in workoutItem!.exerciseList{
            if item.isExerciseBreak{
                processedArray.append(item)
            }
            else{
                let numOfSets = item.setAmount
                for i in 1...numOfSets{
                    let itemToAdd = item.copy() as! Exercise
                    itemToAdd.exerciseName = item.exerciseName + "\nSet - " + String(i)
                    processedArray.append(itemToAdd)
                    if i != numOfSets{
                        processedArray.append(Exercise(true, item.restTime))
                    }
                    
                }
            }
            
        }
    }
    
    
    
    @IBAction func previousExercisePressed(_ sender: Any) {
        if(timerText.textColor == UIColor.systemRed) {
            timerText.textColor = UIColor.black
        }
        
        if(currExerciseIndex > 0) {
            currExerciseIndex -= 1
            
            // disable if at start
            if(currExerciseIndex == 0) {
                btnPreviousExercise.isEnabled = false
            }

            //renable if not at last
            if(currExerciseIndex == (exercises.count) - 2) {
                btnNextExercise.isEnabled = true
                btnNextExercise.setTitle("Next Exercise", for: .normal)
            }

                        
            let curr = exercises[currExerciseIndex]
            currTime = 0
            timerCounting = false
            timer.invalidate()
            pauseStartButton.setTitle("Start", for: .normal)
            updateTextLabels(curr)
            
        }
    }
    
    @IBAction func nextExercisePressed(_ sender: Any) {

        if(timerText.textColor == UIColor.systemRed) {
            timerText.textColor = UIColor.black
        }
        
        exercises[currExerciseIndex].time = currTime
        if(currExerciseIndex < (exercises.count) - 1) {
            currExerciseIndex += 1
            
            // Enable prev if not at 0
            if(currExerciseIndex == 1) {
                btnPreviousExercise.isEnabled = true
            }
            
            //disable btn if at last
            if(currExerciseIndex == (exercises.count) - 1) {
                btnNextExercise.setTitle("Finish Workout", for: .normal)
                
            }
            
            
            let curr = exercises[currExerciseIndex]
            
            if((exercises[currExerciseIndex].isExerciseBreak ==  true)){
                currTime = (exercises[currExerciseIndex].exerciseBreakTime)
            }
            else{
                currTime = 0
            }
            
            timerCounting = false
            timer.invalidate()
            pauseStartButton.setTitle("Start", for: .normal)
            
            updateTextLabels(curr)
            
        }
        else{
            
            workoutItem?.totalDuration = globalTime
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let setViewController = mainStoryboard.instantiateViewController(withIdentifier: "SummaryController") as! SummaryController
            
            setViewController.workout = workoutItem
            setViewController.processedArray = processedArray

            navigationController?.pushViewController(setViewController, animated: true)
        }
    }
    
    // Update the text labels
    func updateTextLabels(_ curr: Exercise?) {
        exerciseText.text = curr?.exerciseName
        if(curr?.isExerciseBreak == true) {
            repText.text = String((curr?.exerciseBreakTime)!) + " second break"
        }
        else {
            repText.text = String((curr?.repRange)!) + " reps"
        }
        
        let time = TimeConversion.convertSec(currTime)
        let timeString = TimeConversion.timeLabelString(time.0, time.1, time.2)
        timerText.text = timeString
        
    }
    
    @IBAction func pauseStartButtonPressed(_ sender: Any) {
        if(timerCounting) {
            timerCounting = false
            timer.invalidate()
            pauseStartButton.setTitle("Start", for: .normal)
        }
        else {
            timerCounting = true
            pauseStartButton.setTitle("Pause", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void {
        
        if((exercises[currExerciseIndex].isExerciseBreak ==  true)){
            currTime -= 1
            if(currTime < 0){
                timerText.textColor = UIColor.systemRed
            }
        }
        else{
            currTime += 1
        }
        
        let time = TimeConversion.convertSec(currTime)
        let timeString = TimeConversion.timeLabelString(time.0, time.1, time.2)
        timerText.text = timeString
        
        globalTime += 1
        let convGlobalTime = TimeConversion.convertSec(globalTime)
        let globalTimeString = TimeConversion.timeLabelString(convGlobalTime.0, convGlobalTime.1, convGlobalTime.2)
        globalTimerText.text = globalTimeString
    }
    
    

    
}
