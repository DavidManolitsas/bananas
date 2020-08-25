//
//  MoodTrackerViewModel.swift
//  a1-s3763636_s3779380_s3557535_s3730303
//
//  Created by Jess Cui on 21/8/20.
//  Copyright © 2020 David Manolitsas. All rights reserved.
//

import Foundation
import UIKit

struct MoodTrackerViewModel {
    // reference to the model object
    //    private var weather = Weather()
    //    private var dailyRecord = DailyRecord()
    private var moodTrackerDatabase = MoodTrackerDatabase()
    private var moodTracker = MoodTracker()
    
    //    private var details: (iconName: String, maxTemp: Double, minTemp: Double) = ("01d", 15.32, 6.04)
    private var currentIdx: Int = 0
    
    private var iconName: String = "01d"
    private var maxTemp: Double = 13.42
    private var minTemp: Double = 7.32
    private let celsius = "°C"
    
    private let dtFormat = "dd-MM-yy"
    init() {
        moodTracker.initMockRecords()
    }
    
    public mutating func getRecordEvent(forDate date: Date) -> Int{
        let record = moodTracker.getRecord(forDate: formatDate(date: date))
        var count = 0
        
        if record.getMood() != Moods.none { count += 1 }
        if record.getNotes() != "" { count += 1 }
        
        return count
    }
    
    //    public mutating func getWeatherDetails() -> (uiImage: UIImage?, maxTemp: String, minTemp: String) {
    //        let details = weather.getNextForecastDetails()
    //
    //        let image = UIImage(named: details.iconName)
    //        let maxTemp = String(details.maxTemp) + celsius
    //        let minTemp = String(details.minTemp) + celsius
    //
    //        return (image, maxTemp, minTemp)
    //
    //    }
    
    //    public func setMood(moodStr: String) {
    //        moodTracker.setMood(asMood: moodStr)
    //    }
    //
    //    public func setNotes(notes: String) {
    //        moodtracker.setNotes(text: notes)
    //    }
    
    public mutating func createRecord(forDate date: String, notes: String, mood: String) {
        moodTracker.setNotes(text: notes)
        moodTracker.setMood(asMood: mood)
        
        moodTracker.createRecord(forDate: date)
    }
    
    public mutating func getMood(forDate date: Date) -> String {
        let record = moodTracker.getRecord(forDate: formatDate(date: date))
        return record.getMood().rawValue
    }
    
    public mutating func getNotes(forDate date: Date) -> String {
        let record = moodTracker.getRecord(forDate: formatDate(date: date))
        return record.getNotes()
    }
    
    //    public mutating func getWeatherDetails(forDate date: Date) -> (iconName: String, maxTemp: Double, minTemp: Double) {
    //
    public mutating func getWeatherDetails(forDate date: Date) -> (uiImage: UIImage?, maxTemp: String, minTemp: String) {
//        let details = moodTracker.getWeatherDetails()
//
//        let image = UIImage(named: details.iconName)
//        let maxTemp = String(details.maxTemp) + celsius
//        let minTemp = String(details.minTemp) + celsius
//
//        return (image, maxTemp, minTemp)
        let record = moodTracker.getRecord(forDate: formatDate(date: date))
        let details = record.getWeatherDetails()
        let image = UIImage(named: details.iconName)
                let maxTemp = String(details.maxTemp) + celsius
                let minTemp = String(details.minTemp) + celsius
        
                return (image, maxTemp, minTemp)
    }
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = dtFormat;
        return formatter.string(from: date);
    }
    
    
}