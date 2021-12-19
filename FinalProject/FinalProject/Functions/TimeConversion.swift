//
//  TimeConversion.swift
//  FinalProject
//
//  Created by Michael Buffone on 2021-12-02.
//

import Foundation

class TimeConversion{
    
    static func convertSec(_ seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    static func timeLabelString(_ hour: Int, _ minute: Int, _ second: Int) -> String {
        
        var negTime = false
        var dispHour = hour
        if(second < 0){
            negTime = true
            dispHour = hour * -1
        }
        var dispMinute = minute
        if(second < 0){
            negTime = true
            dispMinute = minute * -1
        }
        var dispSecond = second
        if(second < 0){
            negTime = true
            dispSecond = second * -1
        }
        
        var timeString = ""
        if(negTime){
            timeString += "-"
        }
        
        if(dispHour <= 9) {
            timeString += String(format: "0%1d", dispHour)
        }
        else {
            timeString += String(hour)
        }
        
        timeString += ":"
        
        if(dispMinute <= 9) {
            timeString += String(format: "0%1d", dispMinute)
        }
        else {
            timeString += String(minute)
        }
        
        timeString += ":"
        
        if(dispSecond <= 9) {
            timeString += String(format: "0%1d", dispSecond)
        }
        else {
            timeString += String(dispSecond)
        }
        
        return timeString
    }
}
