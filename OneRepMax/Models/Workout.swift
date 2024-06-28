//
//  Workout.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let entries: [WorkoutEntry]
    let exercise: String
    let oneRepMaxPR: Int
}
