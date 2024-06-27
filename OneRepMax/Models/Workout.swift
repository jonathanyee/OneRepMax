//
//  Workout.swift
//  OneRepMax
//
//  Created by Jonathan Yee on 6/25/24.
//

import Foundation

struct Workout: Identifiable, Hashable {
    let id = UUID()
    var entries: [WorkoutEntry]
    let exercise: String
    
    var oneRepMax: Int? {
        entries.last?.oneRepMax
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
