/*
 * Sigma Fitness
 * Workout Object
 */

import Foundation

class Workout:Codable{
    var workoutName = ""    
    var exerciseList = [Exercise]()
    var totalDuration = 0
    

    init() {
        

        //for item in exerciseList {
        //    print(item.getExerciseName())
        //}

    }
    
}
