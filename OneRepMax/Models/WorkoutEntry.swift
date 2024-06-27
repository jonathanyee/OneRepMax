//
//  WorkoutEntry.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import Foundation

struct WorkoutEntry: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let exercise: String
    let reps: Int
    let weight: Int
    
    var oneRepMax: Int {
        let ratio = 36.0 / (37.0 - Double(reps))
        let result = round(Double(weight) * ratio)
        return Int(result)
    }
}
