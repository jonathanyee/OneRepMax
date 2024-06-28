//
//  WorkoutParser.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import Foundation

protocol WorkoutParserProtocol {
    func parse() -> [WorkoutEntry]?
}

class WorkoutParser: WorkoutParserProtocol {
    private let filename = "workoutData"
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        return formatter
    }()
    
    func parse() -> [WorkoutEntry]? {
        guard
            let filepath = Bundle.main.path(forResource: filename, ofType: "txt")
        else {
            return nil
        }
        
        var entries = [WorkoutEntry]()
        
        do {
            let data = try String(contentsOfFile: filepath)
            let rows = data.components(separatedBy: "\n")
            
            for row in rows {
                let columns = row.components(separatedBy: ",")
                if let entry = parseColumns(columns: columns) {
                    entries.append(entry)
                }
            }
        } catch {
            print(error)
            return nil
        }
        
        return entries
    }
    
    private func parseColumns(columns: [String]) -> WorkoutEntry? {
        guard
            columns.count == 4
        else {
            return nil
        }
        
        let date = columns[0]
        let exercise = columns[1]
        let reps = columns[2]
        let weight = columns[3]
        
        if let date = dateFormatter.date(from: date),
           let reps = Int(reps),
           let weight = Int(weight) {
            return WorkoutEntry(date: date, exercise: exercise, reps: reps, weight: weight)
        } else {
            return nil
        }
    }
}
