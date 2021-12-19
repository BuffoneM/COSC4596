/*
 * Sigma Fitness
 * Exercise Object
 */

import Foundation

class Exercise:Codable, NSCopying {
    var exerciseName = ""
    var repRange = 0
    var setAmount = 0
    var time = 0
    var restTime = 0
    var isExerciseBreak:Bool = false
    var exerciseBreakTime = 0
    
    init (_ exerciseName: String, _ repRange: Int, _ setAmount: Int, _ restTime: Int) {
        self.exerciseName = exerciseName
        self.repRange = repRange
        self.setAmount = setAmount
        self.restTime = restTime
    }
    
    init (_ exerciseBreak: Bool, _ exerciseBreakTime: Int) {
        self.exerciseName = "Break"
        self.exerciseBreakTime = exerciseBreakTime
        self.isExerciseBreak = exerciseBreak
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        if(isExerciseBreak){
            return Exercise(isExerciseBreak, exerciseBreakTime)
        }
        else{
            return Exercise(exerciseName, repRange, setAmount, restTime)
        }
    }
    
}
