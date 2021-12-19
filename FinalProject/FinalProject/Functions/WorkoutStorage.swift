//
//  WorkoutStorage.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-12-03.
//

import Foundation

class WorkoutStorage{
    var filePath:URL?
    static var workouts:[Workout] = []
    
    init(){
        filePath = getDocumentsDirectory().appendingPathComponent("workouts.json")
        
        if FileManager.default.fileExists(atPath: (filePath?.path)!) {
            do {
                let text = try String(contentsOf: filePath!, encoding: .utf8)
                let data = Data(text.utf8)
                let decoder = JSONDecoder()
                let array = try decoder.decode([Workout].self, from: data)
                WorkoutStorage.workouts = array
           }
            catch {
               print(error.localizedDescription)
           }
        }
        else{
            saveToFile()
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func appendWorkout(_ workout:Workout){
        WorkoutStorage.workouts.append(workout)
    }
    
    func saveToFile(){
        do{
            let jsonEncoder = JSONEncoder()
            try? FileManager().createDirectory(at: getDocumentsDirectory(), withIntermediateDirectories: true)

            let json = try? JSONEncoder().encode(WorkoutStorage.workouts)
            try json!.write(to: filePath!)
        }
        catch{
            
        }
    }
}
